//
//  VectorView.swift
//  draw-vector
//
//  Created by Farid Dahiri on 17.09.2021.
//

import Foundation
import UIKit

class VectorView : UIView {
    var editMode = VectorViewEditMode.draw {
        didSet {
            if editMode == .draw {
                if self.selectedClosedPathView != nil {
                    self.pathSelectionPoint = nil
                    self.detachSelectedVectorPath()
                    self.setNeedsDisplay()
                }
            }
        }
    }
    var currentVectorPath: VectorPath?
    var closedVectorPathCollection = [ClosedVectorPath]()
    var selectedVectorPath: ClosedVectorPath?
    var selectedClosedPathView: ClosedPathSelectionView?
    
    var closedPathViewSelectedResizeAnchorType = ClosedPathSelectionViewAnchorType.none
    var pathResizeStartPoint = CGPoint.zero
    var pathResizeCurrentPoint = CGPoint.zero
    var pathTranslationStartPoint = CGPoint.zero
    var pathTranslationCurrentPoint = CGPoint.zero
    
    var pathSelectionPoint : CGPoint?
    
    func reset() {
        self.currentVectorPath = nil
        self.selectedVectorPath = nil
        self.pathSelectionPoint = nil
        self.selectedVectorPath = nil
        self.closedVectorPathCollection.removeAll()
        
        var closedPathViewSelectedResizeAnchorType = ClosedPathSelectionViewAnchorType.none
        self.pathResizeStartPoint = CGPoint.zero
        self.pathResizeCurrentPoint = CGPoint.zero
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
        let translationPoint = CGPoint(x: self.pathTranslationCurrentPoint.x - self.pathTranslationStartPoint.x, y: self.pathTranslationCurrentPoint.y - self.pathTranslationStartPoint.y)
        let resizePoint = CGPoint(x: self.pathResizeCurrentPoint.x - self.pathResizeStartPoint.x, y: self.pathResizeCurrentPoint.y - self.pathResizeStartPoint.y)
        
        if let selectedClosedPathView = self.selectedClosedPathView {
            switch self.closedPathViewSelectedResizeAnchorType {
            case .none:
                selectedClosedPathView.frame = CGRect(x: selectedClosedPathView.frame.origin.x +
                                                      translationPoint.x,
                                                      y: selectedClosedPathView.frame.origin.y + translationPoint.y,
                                                      width: selectedClosedPathView.frame.size.width,
                                                      height: selectedClosedPathView.frame.size.height)
            case .topLeft:
                selectedClosedPathView.frame = CGRect(x: selectedClosedPathView.frame.origin.x + translationPoint.x,
                                                      y: selectedClosedPathView.frame.origin.y + translationPoint.y,
                                                      width: selectedClosedPathView.frame.size.width - translationPoint.x,
                                                      height: selectedClosedPathView.frame.self.height - translationPoint.y)
            case .topRight:
                selectedClosedPathView.frame = CGRect(x: selectedClosedPathView.frame.origin.x,
                                                      y: selectedClosedPathView.frame.origin.y + translationPoint.y,
                                                      width: selectedClosedPathView.frame.size.width + translationPoint.x,
                                                      height: selectedClosedPathView.frame.self.height - translationPoint.y)
            case .bottomLeft:
                selectedClosedPathView.frame = CGRect(x: selectedClosedPathView.frame.origin.x + translationPoint.x,
                                                      y: selectedClosedPathView.frame.origin.y,
                                                      width: selectedClosedPathView.frame.size.width - translationPoint.x,
                                                      height: selectedClosedPathView.frame.self.height + translationPoint.y)
            case .bottomRight:
                selectedClosedPathView.frame = CGRect(x: selectedClosedPathView.frame.origin.x,
                                                      y: selectedClosedPathView.frame.origin.y,
                                                      width: selectedClosedPathView.frame.size.width + translationPoint.x,
                                                      height: selectedClosedPathView.frame.self.height + translationPoint.y)
            }
        }
        
        self.pathResizeStartPoint = self.pathResizeCurrentPoint
        self.pathTranslationStartPoint = self.pathTranslationCurrentPoint
    }
    
    func drawClosedVectorPathCollection() {
        let closedVectorPathCollection = self.closedVectorPathCollection
        for closedVectorPath in closedVectorPathCollection {
            let bezierPath = closedVectorPath.bezierPath
            if let pathSelectionPoint = self.pathSelectionPoint, bezierPath.contains(pathSelectionPoint) {
                self.selectedVectorPath = closedVectorPath
                self.setNeedsDisplay()
                self.pathSelectionPoint = nil
                let pathView = ClosedPathSelectionView(closedPath: closedVectorPath)
                self.addSubview(pathView)
                self.selectedClosedPathView = pathView
                self.closedVectorPathCollection = self.closedVectorPathCollection.filter { return $0 !== self.selectedVectorPath}
            } else {
                closedVectorPath.strokeColor.setFill()
                closedVectorPath.fillColor.setFill()
                bezierPath.lineWidth = closedVectorPath.strokeWidth
                bezierPath.stroke()
                bezierPath.fill()
            }
        }
    }
    
    func detachSelectedVectorPath() {
        guard let selectedClosedPathView = self.selectedClosedPathView else {
            fatalError()
        }
        guard let selectedVectorPath = self.selectedVectorPath else {
            fatalError()
        }
        let translationPoint = CGPoint(x: selectedClosedPathView.frame.origin.x - selectedVectorPath.bezierPath.bounds.origin.x, y: selectedClosedPathView.frame.origin.y - selectedVectorPath.bezierPath.bounds.origin.y)
        selectedVectorPath.bezierPath.apply(CGAffineTransform(translationX: translationPoint.x, y: translationPoint.y))
        selectedClosedPathView.removeFromSuperview()
        self.selectedClosedPathView = nil
        // TODO: should be inserted at its previous index
        self.closedVectorPathCollection.append(selectedVectorPath)
        self.selectedVectorPath = nil
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
                if let selectedClosedPathView = self.selectedClosedPathView {
                    let selectedClosedPathViewLocation = touch.location(in: selectedClosedPathView)
                    self.closedPathViewSelectedResizeAnchorType = selectedClosedPathView.resizeAnchorType(location: selectedClosedPathViewLocation)
                    if selectedClosedPathView.frame.contains(location) == false, self.closedPathViewSelectedResizeAnchorType == .none {
                        self.detachSelectedVectorPath()
                        self.pathSelectionPoint = location
                    }
                } else {
                    self.pathSelectionPoint = location
                }
                self.pathResizeStartPoint = location
                self.pathResizeCurrentPoint = location
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
                self.pathResizeCurrentPoint = location
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
                // TODO: points should be nilled!
                self.pathTranslationCurrentPoint = CGPoint.zero
                self.pathTranslationStartPoint = CGPoint.zero
                self.pathResizeCurrentPoint = CGPoint.zero
                self.pathResizeStartPoint = CGPoint.zero
            }
            
            self.setNeedsDisplay()
        } else if allTouches.count == 2 {
        }
    }
}
