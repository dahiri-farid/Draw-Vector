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
                    self.removeSelectedVectorPath()
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
    var pathTranslationStartPoint: CGPoint?
    var pathTranslationCurrentPoint: CGPoint?
    
    var pathSelectionPoint : CGPoint?
    
    func reset() {
        self.currentVectorPath = nil
        self.selectedVectorPath = nil
        self.pathSelectionPoint = nil
        self.selectedVectorPath = nil
        self.closedVectorPathCollection.removeAll()
        
        self.closedPathViewSelectedResizeAnchorType = ClosedPathSelectionViewAnchorType.none
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
    
    func updateSelectedVectorPathLayout() {
        if let selectedClosedPathView = self.selectedClosedPathView,
           let pathTranslationCurrentPoint = self.pathTranslationCurrentPoint,
            let pathTranslationStartPoint = self.pathTranslationStartPoint {
            let translationPoint = CGPoint(x: pathTranslationCurrentPoint.x - pathTranslationStartPoint.x,
                                           y: pathTranslationCurrentPoint.y - pathTranslationStartPoint.y)
            var selectedClosedPathViewFrame = selectedClosedPathView.frame
            switch self.closedPathViewSelectedResizeAnchorType {
            case .none:
                selectedClosedPathViewFrame = CGRect(x: selectedClosedPathViewFrame.origin.x +
                                                      translationPoint.x,
                                                      y: selectedClosedPathViewFrame.origin.y + translationPoint.y,
                                                      width: selectedClosedPathViewFrame.size.width,
                                                      height: selectedClosedPathViewFrame.size.height)
            case .topLeft:
                selectedClosedPathViewFrame = CGRect(x: selectedClosedPathViewFrame.origin.x + translationPoint.x,
                                                      y: selectedClosedPathViewFrame.origin.y + translationPoint.y,
                                                      width: selectedClosedPathViewFrame.size.width - translationPoint.x,
                                                      height: selectedClosedPathViewFrame.self.height - translationPoint.y)
            case .topRight:
                selectedClosedPathViewFrame = CGRect(x: selectedClosedPathViewFrame.origin.x,
                                                      y: selectedClosedPathViewFrame.origin.y + translationPoint.y,
                                                      width: selectedClosedPathViewFrame.size.width + translationPoint.x,
                                                      height: selectedClosedPathViewFrame.self.height - translationPoint.y)
            case .bottomLeft:
                selectedClosedPathViewFrame = CGRect(x: selectedClosedPathViewFrame.origin.x + translationPoint.x,
                                                      y: selectedClosedPathViewFrame.origin.y,
                                                      width: selectedClosedPathViewFrame.size.width - translationPoint.x,
                                                      height: selectedClosedPathViewFrame.self.height + translationPoint.y)
            case .bottomRight:
                selectedClosedPathViewFrame = CGRect(x: selectedClosedPathViewFrame.origin.x,
                                                      y: selectedClosedPathViewFrame.origin.y,
                                                      width: selectedClosedPathViewFrame.size.width + translationPoint.x,
                                                      height: selectedClosedPathViewFrame.self.height + translationPoint.y)
            }
            selectedClosedPathView.frame = selectedClosedPathViewFrame
        }
        
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
    
    func removeSelectedVectorPath() {
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
            self.updateSelectedVectorPathLayout()
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
                        self.removeSelectedVectorPath()
                        self.pathSelectionPoint = location
                    }
                } else {
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
                self.pathTranslationCurrentPoint = nil
                self.pathTranslationStartPoint = nil
            }
            
            self.setNeedsDisplay()
        } else if allTouches.count == 2 {
        }
    }
}
