//
//  ICanvas.swift
//  draw-vector
//
//  Created by Farid Dahiri on 25.09.2021.
//

import Foundation
import UIKit

protocol ICanvas {
    var backgroundColor: UIColor { get }
    var editMode: CanvasEditMode { get }
    var currentVectorPath: VectorPath? { get }
    var closedVectorPathCollection: [ClosedVectorPath] { get }
    var selectedVectorPath: ClosedVectorPath? { get }
    
    var closedPathViewSelectedResizeAnchorType: ClosedPathSelectionViewAnchorType { get }
    var pathTranslationStartPoint: CGPoint? { get }
    var pathTranslationCurrentPoint: CGPoint? { get }
    
    var pathSelectionPoint : CGPoint? { get }
}
