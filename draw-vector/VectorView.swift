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
    
    func beginPath(point: CGPoint, editMode: VectorViewEditMode) {
        switch editMode {
        case .draw:
            let currentVectorPath = VectorPath()
            currentVectorPath.path.append(point)
            self.currentVectorPath = currentVectorPath
            self.vectorPathCollection.append(currentVectorPath)
        default: break
        }
        
        self.setNeedsDisplay()
    }
    
    func movePath(point: CGPoint, editMode: VectorViewEditMode) {
        guard let currentVectorPath = self.currentVectorPath else {
            return
        }
        switch editMode {
        case .draw:
            currentVectorPath.path.append(point)
        default: break
        }
        
        self.setNeedsDisplay()
    }
    
    func closePath(point: CGPoint, editMode: VectorViewEditMode) {
        guard let currentVectorPath = self.currentVectorPath else {
            return
        }
        switch editMode {
        case .draw:
            self.vectorPathCollection.append(currentVectorPath)
            self.currentVectorPath = nil
        default: break
        }
        
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
                UIColor.blue.setFill()
                bezierPath.fill()
            }
        }
    }
}
