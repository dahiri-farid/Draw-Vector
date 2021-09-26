//
//  CanvasView.swift
//  draw-vector
//
//  Created by Farid Dahiri on 17.09.2021.
//

import Foundation
import UIKit

protocol CanvasViewDelegate: NSObject {
    var canvas: ICanvas { get }
    
    func reset()
    
    func updateSelectedVectorPathLayout()
    func removeSelectedVectorPath()
    
    func updateCurrentVectorPath(point: CGPoint)
    func closeCurrentVectorPath()
    
    func updatePathSelection(point: CGPoint)
    
    func updateClosedPathViewSelectedResizeAnchorType(anchorType: ClosedPathSelectionViewAnchorType)
    
    func clearTranslationPath()
    func updateCurrentPathTranslation(point: CGPoint)
    func updateStartPathTranslation(point: CGPoint)
}

class CanvasView : UIView {
    weak var delegate: CanvasViewDelegate?
    var editMode = CanvasEditMode.draw {
        didSet {
            if editMode == .draw {
                if self.selectedClosedPathView != nil {
                    self.pathSelectionPoint = nil
                    self.removeSelectedVectorPathView()
                    self.setNeedsDisplay()
                }
            }
        }
    }
    var selectedClosedPathView: ClosedPathSelectionView?
    
    var currentVectorPath: VectorPath?
    var closedVectorPathCollection = [ClosedVectorPath]()
    var selectedVectorPath: ClosedVectorPath?
    
    var closedPathViewSelectedResizeAnchorType = ClosedPathSelectionViewAnchorType.none
    var pathTranslationStartPoint: CGPoint?
    var pathTranslationCurrentPoint: CGPoint?
    
    var pathSelectionPoint : CGPoint?
    
    // MARK: private
    func drawSelectedVectorPathIfNeeded() {
        if let pathSelectionPoint = self.pathSelectionPoint, self.selectClosedVectorPath(atPoint: pathSelectionPoint) {
            if let selectedVectorPath = self.selectedVectorPath {
                let pathView = ClosedPathSelectionView(closedPath: selectedVectorPath)
                self.addSubview(pathView)
                self.selectedClosedPathView = pathView
            }
        }
    }
    
    func drawClosedVectorPathCollection() {
        for closedVectorPath in closedVectorPathCollection {
            let bezierPath = closedVectorPath.bezierPath
            closedVectorPath.strokeColor.setFill()
            closedVectorPath.fillColor.setFill()
            bezierPath.lineWidth = closedVectorPath.strokeWidth
            bezierPath.stroke()
            bezierPath.fill()
        }
    }
    
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
    
    func updateSelectedVectorPathViewFrame() {
        if let selectedClosedPathView = self.selectedClosedPathView,
           let pathTranslationCurrentPoint = self.pathTranslationCurrentPoint,
            let pathTranslationStartPoint = self.pathTranslationStartPoint {
            let translationPoint = CGPoint(x: pathTranslationCurrentPoint.x - pathTranslationStartPoint.x,
                                           y: pathTranslationCurrentPoint.y - pathTranslationStartPoint.y)
            let selectedClosedPathViewInitialOrigin = selectedClosedPathView.initialFrame.origin
            let selectedClosedPathViewInitialSize = selectedClosedPathView.initialFrame.size
            var selectedClosedPathViewFrame = selectedClosedPathView.frame
            switch self.closedPathViewSelectedResizeAnchorType {
            case .none:
                selectedClosedPathViewFrame = CGRect(x: selectedClosedPathViewInitialOrigin.x +
                                                      translationPoint.x,
                                                      y: selectedClosedPathViewInitialOrigin.y + translationPoint.y,
                                                     width: selectedClosedPathViewFrame.size.width,
                                                     height: selectedClosedPathViewFrame.size.height)
            case .topLeft:
                selectedClosedPathViewFrame = CGRect(x: selectedClosedPathViewInitialOrigin.x + translationPoint.x,
                                                      y: selectedClosedPathViewInitialOrigin.y + translationPoint.y,
                                                      width: selectedClosedPathViewInitialSize.width - translationPoint.x,
                                                      height: selectedClosedPathViewInitialSize.height - translationPoint.y)
            case .topRight:
                selectedClosedPathViewFrame = CGRect(x: selectedClosedPathViewInitialOrigin.x,
                                                     y: selectedClosedPathViewInitialOrigin.y + translationPoint.y,
                                                     width: selectedClosedPathViewInitialSize.width + translationPoint.x,
                                                     height: selectedClosedPathViewInitialSize.height - translationPoint.y)
            case .bottomLeft:
                selectedClosedPathViewFrame = CGRect(x: selectedClosedPathViewInitialOrigin.x + translationPoint.x,
                                                     y: selectedClosedPathViewInitialOrigin.y,
                                                     width: selectedClosedPathViewInitialSize.width - translationPoint.x,
                                                     height: selectedClosedPathViewInitialSize.height + translationPoint.y)
            case .bottomRight:
                selectedClosedPathViewFrame = CGRect(x: selectedClosedPathViewInitialOrigin.x,
                                                     y: selectedClosedPathViewInitialOrigin.y,
                                                     width: selectedClosedPathViewInitialSize.width + translationPoint.x,
                                                     height: selectedClosedPathViewInitialSize.height + translationPoint.y)
            }
            selectedClosedPathView.frame = selectedClosedPathViewFrame
        }
    }
    
    // MARK: exportable methods
    func reset() {
        self.currentVectorPath = nil
        self.selectedVectorPath = nil
        self.pathSelectionPoint = nil
        self.selectedVectorPath = nil
        self.closedVectorPathCollection.removeAll()
        
        self.closedPathViewSelectedResizeAnchorType = ClosedPathSelectionViewAnchorType.none
        self.pathTranslationStartPoint = nil
        self.pathTranslationCurrentPoint = nil
    }
    
    func selectClosedVectorPath(atPoint: CGPoint) -> Bool {
        for closedVectorPath in self.closedVectorPathCollection {
            let bezierPath = closedVectorPath.bezierPath
            if let pathSelectionPoint = self.pathSelectionPoint, bezierPath.contains(pathSelectionPoint) {
                self.selectedVectorPath = closedVectorPath
                self.pathSelectionPoint = nil
                self.closedVectorPathCollection = self.closedVectorPathCollection.filter { return $0 !== self.selectedVectorPath}
            }
        }
        
        return self.selectedVectorPath != nil
    }
    
    func removeSelectedVectorPath() {
        guard let selectedVectorPath = self.selectedVectorPath else {
            fatalError()
        }

        self.selectedClosedPathView = nil
        // TODO: should be inserted at its previous index
        self.closedVectorPathCollection.append(selectedVectorPath)
        self.selectedVectorPath = nil
    }
    
    func removeSelectedVectorPathView() {
        guard let selectedClosedPathView = self.selectedClosedPathView else {
            fatalError()
        }
        selectedClosedPathView.removeFromSuperview()
        self.removeSelectedVectorPath()
    }
    
    // MARK: draw
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        // TODO: canvas.backgroundColor
        context.setFillColor(UIColor.yellow.cgColor)
        context.fill(bounds)
        
        switch self.editMode {
        case .draw:
            self.drawCurrentVectorPath()
        default: break
        }
        
        self.drawSelectedVectorPathIfNeeded()
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
                // updateCurrentVectorPath
                let currentVectorPath = VectorPath()
                currentVectorPath.path.append(location)
                self.currentVectorPath = currentVectorPath
            case .select:
                if let selectedClosedPathView = self.selectedClosedPathView {
                    let selectedClosedPathViewLocation = touch.location(in: selectedClosedPathView)
                    // updateClosedPathViewSelectedResizeAnchorType
                    self.closedPathViewSelectedResizeAnchorType = selectedClosedPathView.resizeAnchorType(location: selectedClosedPathViewLocation)
                    if selectedClosedPathView.frame.contains(location) == false, self.closedPathViewSelectedResizeAnchorType == .none {
                        self.removeSelectedVectorPathView()
                        // updatePathSelectionPoint
                        self.pathSelectionPoint = location
                    }
                } else {
                    // updatePathSelectionPoint
                    self.pathSelectionPoint = location
                }
                // updateStartPathTranslation
                self.pathTranslationStartPoint = location
                // updateCurrentPathTranslation
                self.pathTranslationCurrentPoint = location
            }
            
            self.setNeedsDisplay()
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
                // updateCurrentVectorPath
                guard let currentVectorPath = self.currentVectorPath else {
                    return
                }
                currentVectorPath.path.append(location)
            case .select:
                // updateCurrentPathTranslation
                self.pathTranslationCurrentPoint = location
                self.updateSelectedVectorPathViewFrame()
                break
            }
            
            self.setNeedsDisplay()
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
                // closeCurrentVectorPath()
                if let currentVectorPath = self.currentVectorPath {
                    self.closedVectorPathCollection.append(ClosedVectorPath(vectorPath: currentVectorPath))
                }
                self.currentVectorPath = nil
            case .select:
                // closeCurrentVectorPath()
                self.pathTranslationCurrentPoint = nil
                self.pathTranslationStartPoint = nil
                
                // TODO: inside method
                if let selectedVectorPath = self.selectedVectorPath {
                    guard let selectedClosedPathView = self.selectedClosedPathView else {
                        fatalError()
                    }
                    let translationPoint = CGPoint(x: selectedClosedPathView.frame.origin.x - selectedVectorPath.bezierPath.bounds.origin.x, y: selectedClosedPathView.frame.origin.y - selectedVectorPath.bezierPath.bounds.origin.y)
                    selectedVectorPath.bezierPath.apply(CGAffineTransform(translationX: translationPoint.x, y: translationPoint.y))
                    selectedClosedPathView.updateInitialFrame()
                }
            }
            
            self.setNeedsDisplay()
        }
    }
}
