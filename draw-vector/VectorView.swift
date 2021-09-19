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
    var closedVectorPathCollection = [ClosedVectorPath]()
    var pathTranslationStartPoint = CGPoint.zero
    var pathTranslationCurrentPoint = CGPoint.zero
    
    func reset() {
        self.currentVectorPath = nil
        self.closedVectorPathCollection.removeAll()
        self.pathTranslationStartPoint = CGPoint.zero
        self.pathTranslationCurrentPoint = CGPoint.zero
    }
    
    func beginPath(point: CGPoint, editMode: VectorViewEditMode) {
        switch editMode {
        case .draw:
            let currentVectorPath = VectorPath()
            currentVectorPath.path.append(point)
            self.currentVectorPath = currentVectorPath
        case .move:
            self.pathTranslationStartPoint = point
        default: break
        }
        
        self.setNeedsDisplay()
    }
    
    func movePath(point: CGPoint, editMode: VectorViewEditMode) {
        switch editMode {
        case .draw:
            guard let currentVectorPath = self.currentVectorPath else {
                return
            }
            currentVectorPath.path.append(point)
        case .move:
            self.pathTranslationCurrentPoint = point
        default: break
        }
        
        self.setNeedsDisplay()
    }
    
    func closePath(point: CGPoint, editMode: VectorViewEditMode) {
        switch editMode {
        case .draw:
            if let currentVectorPath = self.currentVectorPath {
                self.closedVectorPathCollection.append(ClosedVectorPath(vectorPath: currentVectorPath))
            }
            self.currentVectorPath = nil
        case .move:
            self.pathTranslationCurrentPoint = CGPoint.zero
            self.pathTranslationStartPoint = CGPoint.zero
        default: break
        }
        
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        context.setFillColor(UIColor.yellow.cgColor)
        context.fill(bounds)
        
        if let currentVectorPath = self.currentVectorPath {
            guard let bezierPath = currentVectorPath.bezierPath else {
                fatalError()
            }
            currentVectorPath.fillColor.setFill()
            currentVectorPath.strokeColor.setStroke()
            bezierPath.lineWidth = currentVectorPath.strokeWidth
            bezierPath.fill()
            bezierPath.stroke()
        }
        let closedVectorPathCollection = self.closedVectorPathCollection
        for closedVectorPath in closedVectorPathCollection {
            let bezierPath = closedVectorPath.bezierPath
            if self.pathTranslationCurrentPoint != CGPoint.zero {
                if bezierPath.contains(self.pathTranslationCurrentPoint) {
                    let translationPoint = CGPoint(x: self.pathTranslationCurrentPoint.x - self.pathTranslationStartPoint.x, y: self.pathTranslationCurrentPoint.y - self.pathTranslationStartPoint.y)
                    bezierPath.apply(CGAffineTransform(translationX: translationPoint.x, y: translationPoint.y))
                    self.pathTranslationStartPoint = self.pathTranslationCurrentPoint
                    self.setNeedsDisplay()
                }
            }
            
            closedVectorPath.strokeColor.setFill()
            closedVectorPath.fillColor.setFill()
            bezierPath.lineWidth = closedVectorPath.strokeWidth
            bezierPath.stroke()
            bezierPath.fill()
        }
    }
}
