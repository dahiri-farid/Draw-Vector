//
//  VectorViewControllerModel.swift
//  draw-vector
//
//  Created by Farid Dahiri on 19.09.2021.
//

import Foundation

enum VectorViewMode {
    case draw
    case drawOptions
    case move
    case scale
    case edit
    case delete
}

class VectorViewControllerModel {
    var viewMode: VectorViewMode = .draw
}
