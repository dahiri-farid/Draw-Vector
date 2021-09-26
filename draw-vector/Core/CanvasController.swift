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
    
    func selectClosedVectorPath(atPoint: CGPoint) -> Bool {
        for closedVectorPath in self._canvas.closedVectorPathCollection {
            let bezierPath = closedVectorPath.bezierPath
            if let pathSelectionPoint = self._canvas.pathSelectionPoint, bezierPath.contains(pathSelectionPoint) {
                self._canvas.selectedVectorPath = closedVectorPath
                self._canvas.pathSelectionPoint = nil
                self._canvas.closedVectorPathCollection = self._canvas.closedVectorPathCollection.filter { return $0 !== self._canvas.selectedVectorPath}
            }
        }
        
        return self._canvas.selectedVectorPath != nil
    }
}
