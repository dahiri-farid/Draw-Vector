//
//  Canvas.swift
//  draw-vector
//
//  Created by Farid Dahiri on 24.09.2021.
//

import Foundation
import UIKit

class Canvas: ICanvas {
    var backgroundColor = UIColor.white
    var editMode = CanvasEditMode.draw
    var currentVectorPath: VectorPath?
    var closedVectorPathCollection = [ClosedVectorPath]()
    var selectedVectorPath: ClosedVectorPath?
    
    var closedPathViewSelectedResizeAnchorType = ClosedPathSelectionViewAnchorType.none
    var pathTranslationStartPoint: CGPoint?
    var pathTranslationCurrentPoint: CGPoint?
    
    var pathSelectionPoint : CGPoint?
}
