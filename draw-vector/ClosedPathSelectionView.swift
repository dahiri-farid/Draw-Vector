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
    let dashedBorderLayer = CAShapeLayer()
    
    init(closedPath: ClosedVectorPath) {
        self.closedPath = closedPath
        
        super.init(frame: self.closedPath.bezierPath.bounds)
        
        self.dashedBorderLayer.fillColor = UIColor.clear.cgColor
        self.dashedBorderLayer.strokeColor = UIColor.blue.cgColor
        self.dashedBorderLayer.lineWidth = 2
        self.dashedBorderLayer.lineJoin = CAShapeLayerLineJoin.round
        self.dashedBorderLayer.lineDashPattern = [6,6]
        self.layer.addSublayer(self.dashedBorderLayer)
        
        self.backgroundColor = .clear
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
        
        self.dashedBorderLayer.position = CGPoint(x: self.bounds.size.width / 2, y: self.bounds.size.height / 2)
        self.dashedBorderLayer.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: 5).cgPath
        self.dashedBorderLayer.frame = self.bounds
    }
}
