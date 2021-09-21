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
    var selectedVectorPath: ClosedVectorPath?
    var selectedClosedPathView: ClosedPathSelectionView?
    
    var pathTranslationStartPoint = CGPoint.zero
    var pathTranslationCurrentPoint = CGPoint.zero
    
    var pathSelectionPoint : CGPoint?
    
    func reset() {
        self.currentVectorPath = nil
        self.selectedVectorPath = nil
        self.pathSelectionPoint = nil
        self.selectedVectorPath = nil
        self.closedVectorPathCollection.removeAll()
        
        self.pathTranslationStartPoint = CGPoint.zero
        self.pathTranslationCurrentPoint = CGPoint.zero
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
    
    func drawSelectedVectorPath() {
        // TODO: draw selected view here
        let translationPoint = CGPoint(x: self.pathTranslationCurrentPoint.x - self.pathTranslationStartPoint.x, y: self.pathTranslationCurrentPoint.y - self.pathTranslationStartPoint.y)
        
        if let selectedClosedPathView = self.selectedClosedPathView {
            selectedClosedPathView.frame = CGRect(x: selectedClosedPathView.frame.origin.x +
                                                    translationPoint.x,
                                                  y: selectedClosedPathView.frame.origin.y + translationPoint.y,
                                                  width: selectedClosedPathView.frame.size.width,
                                                  height: selectedClosedPathView.frame.size.height)
            print("translation \(translationPoint)")
        }
        
        self.pathTranslationStartPoint = self.pathTranslationCurrentPoint
    }
    
    func drawClosedVectorPathCollection() {
        let closedVectorPathCollection = self.closedVectorPathCollection
        for closedVectorPath in closedVectorPathCollection {
            let bezierPath = closedVectorPath.bezierPath
            if let pathSelectionPoint = self.pathSelectionPoint {
                if bezierPath.contains(pathSelectionPoint) {
                    self.selectedVectorPath = closedVectorPath
                    self.setNeedsDisplay()
                    self.pathSelectionPoint = nil
                    let pathView = ClosedPathSelectionView(closedPath: closedVectorPath)
                    self.addSubview(pathView)
                    self.selectedClosedPathView = pathView
                    self.closedVectorPathCollection = self.closedVectorPathCollection.filter { return $0 !== self.selectedVectorPath}
                }
            } else {
                closedVectorPath.strokeColor.setFill()
                closedVectorPath.fillColor.setFill()
                bezierPath.lineWidth = closedVectorPath.strokeWidth
                bezierPath.stroke()
                bezierPath.fill()
            }
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
        case .select:
            self.drawSelectedVectorPath()
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
            case .select:
                if self.selectedClosedPathView == nil {
                    self.pathSelectionPoint = location
                }
                self.pathTranslationStartPoint = location
                self.pathTranslationCurrentPoint = location
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
            case .select:
                self.pathTranslationCurrentPoint = location
                break
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
            case .select:
                self.pathTranslationCurrentPoint = CGPoint.zero
                self.pathTranslationStartPoint = CGPoint.zero
            }
            
            self.setNeedsDisplay()
        } else if allTouches.count == 2 {
        }
    }
}
