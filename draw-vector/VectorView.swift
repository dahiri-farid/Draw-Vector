//
//  VectorView.swift
//  draw-vector
//
//  Created by Farid Dahiri on 17.09.2021.
//

import Foundation
import UIKit

class VectorView : UIView {
    var editMode = VectorViewEditMode.draw
    var currentVectorPath: VectorPath?
    var closedVectorPathCollection = [ClosedVectorPath]()
    var previousPoint = CGPoint.zero
    var pathTranslationStartPoint = CGPoint.zero
    var pathTranslationCurrentPoint = CGPoint.zero
    
    func reset() {
        self.currentVectorPath = nil
        self.closedVectorPathCollection.removeAll()
        self.pathTranslationStartPoint = CGPoint.zero
        self.pathTranslationCurrentPoint = CGPoint.zero
    }
    
    // MARK: draw
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
                    switch self.editMode {
                    case .move:
                        let translationPoint = CGPoint(x: self.pathTranslationCurrentPoint.x - self.pathTranslationStartPoint.x, y: self.pathTranslationCurrentPoint.y - self.pathTranslationStartPoint.y)
                        bezierPath.apply(CGAffineTransform(translationX: translationPoint.x, y: translationPoint.y))
                        self.pathTranslationStartPoint = self.pathTranslationCurrentPoint
                    default: break
                    }
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
    
    // MARK: touches
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let event = event else {
            return
        }
        guard let allTouches = event.allTouches else {
            return
        }
        if allTouches.count == 1 {
            let touch = touches.first!
            let location = touch.location(in: self)
            self.previousPoint = location
            switch self.editMode {
            case .draw:
                let currentVectorPath = VectorPath()
                currentVectorPath.path.append(location)
                self.currentVectorPath = currentVectorPath
            case .move:
                self.pathTranslationStartPoint = location
            default: break
            }
            
            self.setNeedsDisplay()
        } else if allTouches.count == 2 {
            if self.editMode == .scale {
                print("scale begin")
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let event = event else {
            return
        }
        guard let allTouches = event.allTouches else {
            return
        }
        if allTouches.count == 1 {
            let touch = touches.first!
            let location = touch.location(in: self)
            if !(location.x == self.previousPoint.x && location.y == self.previousPoint.y) {
                switch self.editMode {
                case .draw:
                    guard let currentVectorPath = self.currentVectorPath else {
                        return
                    }
                    currentVectorPath.path.append(location)
                case .move:
                    self.pathTranslationCurrentPoint = location
                default: break
                }
                
                self.setNeedsDisplay()
                self.previousPoint = location
            }
        } else if allTouches.count == 2 {
            if self.editMode == .scale {
                print("scale move")
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let event = event else {
            return
        }
        guard let allTouches = event.allTouches else {
            return
        }
        if allTouches.count == 1 {
            let touch = touches.first!
            let location = touch.location(in: self)
            if !(location.x == self.previousPoint.x && location.y == self.previousPoint.y) {
                switch self.editMode {
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
        } else if allTouches.count == 2 {
            if self.editMode == .scale {
                print("scale end")
            }
        }
    }
}
