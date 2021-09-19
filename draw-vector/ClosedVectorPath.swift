//
//  RenderedVectorPath.swift
//  draw-vector
//
//  Created by Farid Dahiri on 20.09.2021.
//

import UIKit

class ClosedVectorPath {
    var strokeWidth: CGFloat = 1.0
    var strokeColor = UIColor.black
    var fillColor = UIColor.black
    
    var bezierPath: UIBezierPath
    
    init(vectorPath: VectorPath) {
        self.strokeWidth = vectorPath.strokeWidth
        self.strokeColor = vectorPath.strokeColor
        self.fillColor = vectorPath.fillColor
        guard let bezierPath = vectorPath.bezierPath else {
            fatalError()
        }
        self.bezierPath = bezierPath
    }
}
