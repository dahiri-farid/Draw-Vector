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
    
    private let canvasController: CanvasController
    
    init(canvasController: CanvasController) {
        self.canvasController = canvasController
    }
    
    func updateBackgroundColor(color: UIColor) {
        self.canvasController.updateBackgroundColor(color: color)
    }
}
