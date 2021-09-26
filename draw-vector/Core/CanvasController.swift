//
//  CanvasController.swift
//  draw-vector
//
//  Created by Farid Dahiri on 24.09.2021.
//

import Foundation
import UIKit

protocol CanvasControllerDelegate: NSObject {
    func canvasDidUpdateBackgroundColor()
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
    
    func removeSelectedVectorPath() {
        guard let selectedVectorPath = self._canvas.selectedVectorPath else {
            fatalError()
        }

        // TODO: should be inserted at its previous index
        self._canvas.closedVectorPathCollection.append(selectedVectorPath)
        self._canvas.selectedVectorPath = nil
    }
    
    func updateCurrentVectorPath(point: CGPoint) {
        if self._canvas.currentVectorPath == nil {
            self._canvas.currentVectorPath = VectorPath()
        }
        guard let currentVectorPath = self._canvas.currentVectorPath else {
            fatalError()
        }
        currentVectorPath.path.append(point)
    }
    
    func closeCurrentVectorPath() {
        if let currentVectorPath = self._canvas.currentVectorPath {
            self._canvas.closedVectorPathCollection.append(ClosedVectorPath(vectorPath: currentVectorPath))
        }
        self._canvas.currentVectorPath = nil
    }
    
    func updatePathSelection(point: CGPoint) {
        self._canvas.pathSelectionPoint = point
    }
    
    func updateClosedPathViewSelectedResizeAnchorType(anchorType: ClosedPathSelectionViewAnchorType) {
        self._canvas.closedPathViewSelectedResizeAnchorType = anchorType
    }
    
    func clearTranslationPath() {
        self._canvas.pathTranslationCurrentPoint = nil
        self._canvas.pathTranslationStartPoint = nil
    }
    
    func updateCurrentPathTranslation(point: CGPoint) {
        self._canvas.pathTranslationCurrentPoint = point
    }
    
    func updateStartPathTranslation(point: CGPoint) {
        self._canvas.pathTranslationStartPoint = point
    }
    
    func updateMode(editMode: CanvasEditMode) {
        self._canvas.editMode = editMode
    }
    
    func updateBackgroundColor(color: UIColor) {
        self._canvas.backgroundColor = color
        guard let delegate = self.delegate else {
            fatalError()
        }
        delegate.canvasDidUpdateBackgroundColor()
    }
}
