//
//  VectorView.swift
//  draw-vector
//
//  Created by Farid Dahiri on 17.09.2021.
//

import Foundation
import UIKit

class VectorView : UIView {
    
    var currentPath = [CGPoint]()
    var pathCollection = [[CGPoint]]()
    
    func reset() {
        self.currentPath.removeAll()
        self.pathCollection.removeAll()
    }
    
    func beginPath(point: CGPoint) {
        self.currentPath.append(point)
        self.pathCollection.append(self.currentPath)
        self.setNeedsDisplay()
    }
    
    func closePath(point: CGPoint) {
        self.currentPath.append(point)
        self.currentPath.removeAll()
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        
        // 1
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        context.setFillColor(UIColor.yellow.cgColor)
        context.fill(bounds)
        
        for path in self.pathCollection {
            if path.count > 1 {
                let bezierPath = UIBezierPath()
                
                let origin = path.first!
                bezierPath.move(to: origin)
                
                for point in path[1...] {
                    bezierPath.addLine(to: point)
                }
                
                bezierPath.close()
                
                UIColor.blue.setFill()
                bezierPath.fill()
            }
        }
    }
}
