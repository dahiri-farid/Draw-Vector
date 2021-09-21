//
//  VectorView.swift
//  draw-vector
//
//  Created by Farid Dahiri on 17.09.2021.
//

import Foundation
import UIKit

//Farid you only need to states:
//1. Draw as it is now
//2. Select - on select you should create a layer or even a UIView you will add the bezierPath on it, this way it will be much easier to manipulate it

class VectorView : UIView {
    var editMode = VectorViewEditMode.draw
    var currentVectorPath: VectorPath?
    var closedVectorPathCollection = [ClosedVectorPath]()
    var selectedVectorPath: VectorPath?
    
    var pathSelectionPoint : CGPoint?
    
    func reset() {
        self.currentVectorPath = nil
        self.pathSelectionPoint = nil
        self.selectedVectorPath = nil
        self.closedVectorPathCollection.removeAll()
    }
    
    // MARK: private
    func drawCurrentVectorPath() {
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
    }
    
    func drawClosedVectorPathCollection() {
        let closedVectorPathCollection = self.closedVectorPathCollection
        for closedVectorPath in closedVectorPathCollection {
            let bezierPath = closedVectorPath.bezierPath
            closedVectorPath.strokeColor.setFill()
            closedVectorPath.fillColor.setFill()
            bezierPath.lineWidth = closedVectorPath.strokeWidth
            bezierPath.stroke()
            bezierPath.fill()
            print("bezierPath bounds \(bezierPath.bounds)")
        }
    }
    
    // MARK: draw
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        context.setFillColor(UIColor.yellow.cgColor)
        context.fill(bounds)
        
        switch self.editMode {
        case .draw:
            self.drawCurrentVectorPath()
        default: break
        }
        
        self.drawClosedVectorPathCollection()
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
            switch self.editMode {
            case .draw:
                let currentVectorPath = VectorPath()
                currentVectorPath.path.append(location)
                self.currentVectorPath = currentVectorPath
            default: break
            }
            
            self.setNeedsDisplay()
        } else if allTouches.count == 2 {
            
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
            switch self.editMode {
            case .draw:
                guard let currentVectorPath = self.currentVectorPath else {
                    return
                }
                currentVectorPath.path.append(location)
            default: break
            }
            
            self.setNeedsDisplay()
        } else if allTouches.count == 2 {
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
            switch self.editMode {
            case .draw:
                if let currentVectorPath = self.currentVectorPath {
                    self.closedVectorPathCollection.append(ClosedVectorPath(vectorPath: currentVectorPath))
                }
                self.currentVectorPath = nil
            default: break
            }
            
            self.setNeedsDisplay()
        } else if allTouches.count == 2 {
        }
    }
}
