//
//  CanvasController.swift
//  draw-vector
//
//  Created by Farid Dahiri on 24.09.2021.
//

import Foundation

protocol CanvasControllerDelegate: NSObject {
    func canvasDidUpdateEditMode(editMode: CanvasEditMode)
}

class CanvasController {
    private let _canvas = Canvas()
    
    weak var delegate: CanvasControllerDelegate?
    var canvas: ICanvas {
        get {
            return _canvas
        }
    }
    
    func reset() {
        let canvas = self._canvas;
        canvas.currentVectorPath = nil
        canvas.selectedVectorPath = nil
        canvas.pathSelectionPoint = nil
        canvas.selectedVectorPath = nil
        canvas.closedVectorPathCollection.removeAll()
        
        canvas.closedPathViewSelectedResizeAnchorType = ClosedPathSelectionViewAnchorType.none
        canvas.pathTranslationStartPoint = nil
        canvas.pathTranslationCurrentPoint = nil
        canvas.editMode = .draw
    }
    
    func updateSelectedVectorPathLayout() {
        if let selectedClosedPathView = self.canvas.selectedClosedPathView,
           let pathTranslationCurrentPoint = self.canvas.pathTranslationCurrentPoint,
           let pathTranslationStartPoint = self.canvas.pathTranslationStartPoint {
            let translationPoint = CGPoint(x: pathTranslationCurrentPoint.x - pathTranslationStartPoint.x,
                                           y: pathTranslationCurrentPoint.y - pathTranslationStartPoint.y)
            var selectedClosedPathViewFrame = selectedClosedPathView.frame
            switch self.canvas.closedPathViewSelectedResizeAnchorType {
            case .none:
                selectedClosedPathViewFrame = CGRect(x: selectedClosedPathViewFrame.origin.x +
                                                      translationPoint.x,
                                                      y: selectedClosedPathViewFrame.origin.y + translationPoint.y,
                                                      width: selectedClosedPathViewFrame.size.width,
                                                      height: selectedClosedPathViewFrame.size.height)
            case .topLeft:
                selectedClosedPathViewFrame = CGRect(x: selectedClosedPathViewFrame.origin.x + translationPoint.x,
                                                      y: selectedClosedPathViewFrame.origin.y + translationPoint.y,
                                                      width: selectedClosedPathViewFrame.size.width - translationPoint.x,
                                                      height: selectedClosedPathViewFrame.self.height - translationPoint.y)
            case .topRight:
                selectedClosedPathViewFrame = CGRect(x: selectedClosedPathViewFrame.origin.x,
                                                      y: selectedClosedPathViewFrame.origin.y + translationPoint.y,
                                                      width: selectedClosedPathViewFrame.size.width + translationPoint.x,
                                                      height: selectedClosedPathViewFrame.self.height - translationPoint.y)
            case .bottomLeft:
                selectedClosedPathViewFrame = CGRect(x: selectedClosedPathViewFrame.origin.x + translationPoint.x,
                                                      y: selectedClosedPathViewFrame.origin.y,
                                                      width: selectedClosedPathViewFrame.size.width - translationPoint.x,
                                                      height: selectedClosedPathViewFrame.self.height + translationPoint.y)
            case .bottomRight:
                selectedClosedPathViewFrame = CGRect(x: selectedClosedPathViewFrame.origin.x,
                                                      y: selectedClosedPathViewFrame.origin.y,
                                                      width: selectedClosedPathViewFrame.size.width + translationPoint.x,
                                                      height: selectedClosedPathViewFrame.self.height + translationPoint.y)
            }
            selectedClosedPathView.frame = selectedClosedPathViewFrame
        }
        
        self._canvas.pathTranslationStartPoint = self._canvas.pathTranslationCurrentPoint
    }
    
    func removeSelectedVectorPath() {
        guard let selectedClosedPathView = self._canvas.selectedClosedPathView else {
            fatalError()
        }
        guard let selectedVectorPath = self._canvas.selectedVectorPath else {
            fatalError()
        }
        let translationPoint = CGPoint(x: selectedClosedPathView.frame.origin.x - selectedVectorPath.bezierPath.bounds.origin.x, y: selectedClosedPathView.frame.origin.y - selectedVectorPath.bezierPath.bounds.origin.y)
        selectedVectorPath.bezierPath.apply(CGAffineTransform(translationX: translationPoint.x, y: translationPoint.y))
        selectedClosedPathView.removeFromSuperview()
        self._canvas.selectedClosedPathView = nil
        // TODO: should be inserted at its previous index
        self._canvas.closedVectorPathCollection.append(selectedVectorPath)
        self._canvas.selectedVectorPath = nil
    }
}
