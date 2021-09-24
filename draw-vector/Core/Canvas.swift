//
//  Canvas.swift
//  draw-vector
//
//  Created by Farid Dahiri on 24.09.2021.
//

import Foundation

class Canvas {
    var editMode = CanvasEditMode.draw
    var currentVectorPath: VectorPath?
    var closedVectorPathCollection = [ClosedVectorPath]()
    var selectedVectorPath: ClosedVectorPath?
    var selectedClosedPathView: ClosedPathSelectionView?
    
    var closedPathViewSelectedResizeAnchorType = ClosedPathSelectionViewAnchorType.none
    var pathTranslationStartPoint: CGPoint?
    var pathTranslationCurrentPoint: CGPoint?
    
    var pathSelectionPoint : CGPoint?
}
