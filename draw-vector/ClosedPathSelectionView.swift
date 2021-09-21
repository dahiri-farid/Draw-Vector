//
//  ClosedPathSelectionView.swift
//  draw-vector
//
//  Created by Farid Dahiri on 21.09.2021.
//

import Foundation
import UIKit

class ClosedPathSelectionView : UIView {
    let closedPath: ClosedVectorPath
    
    init(closedPath: ClosedVectorPath) {
        self.closedPath = closedPath
        super.init(frame: self.closedPath.bezierPath.bounds)
        self.backgroundColor = .cyan
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)

        let bezierPath = self.closedPath.bezierPath.copy() as! UIBezierPath
        self.closedPath.fillColor.setFill()
        self.closedPath.strokeColor.setStroke()
        bezierPath.lineWidth = self.closedPath.strokeWidth
        bezierPath.apply(CGAffineTransform(translationX: -bezierPath.bounds.origin.x, y: -bezierPath.bounds.origin.y))
        bezierPath.fill()
        bezierPath.stroke()
    }
}
