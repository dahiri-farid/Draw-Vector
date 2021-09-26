//
//  DrawOptionsViewControllerModel.swift
//  draw-vector
//
//  Created by Farid Dahiri on 24.09.2021.
//

import Foundation
import UIKit

class DrawOptionsViewControllerModel {
    var canvas: ICanvas {
        get {
            return self.canvasController.canvas
        }
    }
    var backgroundColor: UIColor {
        get {
            if let selectedVectorPath = canvas.selectedVectorPath {
                return selectedVectorPath.fillColor
            } else {
                return canvas.backgroundColor
            }
        }
    }
    
    private let canvasController: CanvasController
    
    init(canvasController: CanvasController) {
        self.canvasController = canvasController
    }
    
    func updateBackgroundColor(color: UIColor) {
        if let selectedVectorPath = canvas.selectedVectorPath {
            self.canvasController.updateSelectedVectorPathBackgroundColor(color: color)
        } else {
            self.canvasController.updateBackgroundColor(color: color)
        }
    }
}
