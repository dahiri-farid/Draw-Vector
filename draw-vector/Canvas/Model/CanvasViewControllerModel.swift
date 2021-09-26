//
//  CanvasViewControllerModel.swift
//  draw-vector
//
//  Created by Farid Dahiri on 19.09.2021.
//

import Foundation

protocol CanvasViewControllerModelDelegate: NSObject {
    func didUpdateSelectedVectorPath()
    func didUpdateBackgroundColor()
    func didUpdateSelectedVectorPathBackgroundColor()
}

class CanvasViewControllerModel: NSObject, CanvasControllerDelegate {
    var canvas: ICanvas {
        get {
            return self.canvasController.canvas
        }
    }
    weak var delegate: CanvasViewControllerModelDelegate?
    
    let canvasController: CanvasController
    
    init(canvasController: CanvasController) {
        self.canvasController = canvasController
        super.init()
        self.canvasController.delegate = self
    }
    
    func reset() {
        self.canvasController.reset()
    }
    
    func removeSelectedVectorPath() {
        self.canvasController.removeSelectedVectorPath()
    }
    
    func updateCurrentVectorPath(point: CGPoint) {
        self.canvasController.updateCurrentVectorPath(point: point)
    }
    
    func closeCurrentVectorPath() {
        self.canvasController.closeCurrentVectorPath()
    }
    
    func updatePathSelection(point: CGPoint) {
        self.canvasController.updatePathSelection(point: point)
    }
    
    func updateClosedPathViewSelectedResizeAnchorType(anchorType: ClosedPathSelectionViewAnchorType) {
        self.canvasController.updateClosedPathViewSelectedResizeAnchorType(anchorType: anchorType)
    }
    
    func clearTranslationPath() {
        self.canvasController.clearTranslationPath()
    }
    
    func updateCurrentPathTranslation(point: CGPoint) {
        self.canvasController.updateCurrentPathTranslation(point: point)
    }
    
    func updateStartPathTranslation(point: CGPoint) {
        self.canvasController.updateStartPathTranslation(point: point)
    }
    
    func selectClosedVectorPath(atPoint: CGPoint) -> Bool {
        guard let delegate = delegate else {
            fatalError()
        }
        
        let didSelectVectorPath = self.canvasController.selectClosedVectorPath(atPoint: atPoint)
        delegate.didUpdateSelectedVectorPath()
        return didSelectVectorPath
    }
    
    func updateMode(mode: CanvasEditMode) {
        self.canvasController.updateMode(editMode: mode)
    }
    
    // MARK: CanvasControllerDelegate
    func canvasDidUpdateBackgroundColor() {
        guard let delegate = self.delegate else {
            fatalError()
        }
        delegate.didUpdateBackgroundColor()
    }
    
    func canvasDidUpdateSelectedVectorPathBackgroundColor() {
        guard let delegate = self.delegate else {
            fatalError()
        }
        delegate.didUpdateSelectedVectorPathBackgroundColor()
    }
}
