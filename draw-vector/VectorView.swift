//
//  VectorView.swift
//  draw-vector
//
//  Created by Farid Dahiri on 17.09.2021.
//

import Foundation
import UIKit

class VectorView : UIView {
    var currentVectorPath: VectorPath?
    var vectorPathCollection = [VectorPath]()
    
    func reset() {
        self.currentVectorPath = nil
        self.vectorPathCollection.removeAll()
    }
    
    func beginPath(point: CGPoint) {
        let currentVectorPath = VectorPath()
        currentVectorPath.path.append(point)
        self.currentVectorPath = currentVectorPath
        self.vectorPathCollection.append(currentVectorPath)
        self.setNeedsDisplay()
    }
    
    func movePath(point: CGPoint) {
        guard let currentVectorPath = self.currentVectorPath else {
            return
        }
        currentVectorPath.path.append(point)
        self.setNeedsDisplay()
    }
    
    func closePath(point: CGPoint) {
        guard let currentVectorPath = self.currentVectorPath else {
            return
        }
        self.vectorPathCollection.append(currentVectorPath)
        self.currentVectorPath = nil
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        
        // 1
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        context.setFillColor(UIColor.yellow.cgColor)
        context.fill(bounds)
        
        for vectorPath in self.vectorPathCollection {
            if vectorPath.path.count > 1 {
                let bezierPath = UIBezierPath()
                
                let origin = vectorPath.path.first!
                bezierPath.move(to: origin)
                
                for point in vectorPath.path[1...] {
                    bezierPath.addLine(to: point)
                }
                
                bezierPath.close()
                let string = DVSVGConverter.svgString(from: bezierPath.cgPath, size: self.bounds.size)
                print("SVG \(string)")
                
                UIColor.blue.setFill()
                bezierPath.fill()
            }
        }
    }
}
