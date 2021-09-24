//
//  VectorViewControllerModel.swift
//  draw-vector
//
//  Created by Farid Dahiri on 19.09.2021.
//

import Foundation

class VectorViewControllerModel {
    var viewMode: CanvasEditMode = .draw
    let canvasController: CanvasController
    
    init(canvasController: CanvasController) {
        self.canvasController = canvasController
    }
}
