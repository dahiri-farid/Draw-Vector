//
//  CanvasView.swift
//  draw-vector
//
//  Created by Farid Dahiri on 17.09.2021.
//

import Foundation
import UIKit

protocol CanvasViewDataSource: NSObject {
    var canvas: ICanvas { get }
}

protocol CanvasViewDelegate: NSObject {
    
    func reset()
    
    func removeSelectedVectorPath()
    
    func updateCurrentVectorPath(point: CGPoint)
    func closeCurrentVectorPath()
    
    func updatePathSelection(point: CGPoint)
    
    func updateClosedPathViewSelectedResizeAnchorType(anchorType: ClosedPathSelectionViewAnchorType)
    
    func clearTranslationPath()
    func updateCurrentPathTranslation(point: CGPoint)
    func updateStartPathTranslation(point: CGPoint)
    
    func selectClosedVectorPath(atPoint: CGPoint) -> Bool
}

class CanvasView : UIView {
    weak var dataSource: CanvasViewDataSource?
    weak var delegate: CanvasViewDelegate?
    
    private var selectedClosedPathView: ClosedPathSelectionView?
    
    // MARK: public
    func update() {
        guard let dataSource = self.dataSource else {
            fatalError()
        }
        if dataSource.canvas.editMode == .draw {
            if self.selectedClosedPathView != nil {
                self.removeSelectedVectorPathView()
            }
        }
        self.setNeedsDisplay()
    }
    
    // MARK: private
    func drawSelectedVectorPathIfNeeded() {
        guard let dataSource = self.dataSource else {
            fatalError()
        }
        guard let delegate = self.delegate else {
            fatalError()
        }
        if let pathSelectionPoint = dataSource.canvas.pathSelectionPoint, delegate.selectClosedVectorPath(atPoint: pathSelectionPoint) {
            if let selectedVectorPath = dataSource.canvas.selectedVectorPath {
                let pathView = ClosedPathSelectionView(closedPath: selectedVectorPath)
                self.addSubview(pathView)
                self.selectedClosedPathView = pathView
            }
        }
    }
    
    func drawClosedVectorPathCollection() {
        guard let dataSource = self.dataSource else {
            fatalError()
        }
        for closedVectorPath in dataSource.canvas.closedVectorPathCollection {
            let bezierPath = closedVectorPath.bezierPath
            closedVectorPath.strokeColor.setFill()
            closedVectorPath.fillColor.setFill()
            bezierPath.lineWidth = closedVectorPath.strokeWidth
            bezierPath.stroke()
            bezierPath.fill()
        }
    }
    
    func drawCurrentVectorPath() {
        guard let dataSource = self.dataSource else {
            fatalError()
        }
        if let currentVectorPath = dataSource.canvas.currentVectorPath {
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
        guard let dataSource = self.dataSource else {
            fatalError()
        }
        if let selectedClosedPathView = self.selectedClosedPathView,
           let pathTranslationCurrentPoint = dataSource.canvas.pathTranslationCurrentPoint,
            let pathTranslationStartPoint = dataSource.canvas.pathTranslationStartPoint {
            let translationPoint = CGPoint(x: pathTranslationCurrentPoint.x - pathTranslationStartPoint.x,
                                           y: pathTranslationCurrentPoint.y - pathTranslationStartPoint.y)
            let selectedClosedPathViewInitialOrigin = selectedClosedPathView.initialFrame.origin
            let selectedClosedPathViewInitialSize = selectedClosedPathView.initialFrame.size
            var selectedClosedPathViewFrame = selectedClosedPathView.frame
            switch dataSource.canvas.closedPathViewSelectedResizeAnchorType {
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
    
    func removeSelectedVectorPathView() {
        guard let delegate = self.delegate else {
            fatalError()
        }
        guard let selectedClosedPathView = self.selectedClosedPathView else {
            fatalError()
        }
        selectedClosedPathView.removeFromSuperview()
        self.selectedClosedPathView = nil
        delegate.removeSelectedVectorPath()
    }
    
    // MARK: draw
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else {
            fatalError()
        }
        guard let dataSource = dataSource else {
            fatalError()
        }
        let backgroundColor = dataSource.canvas.backgroundColor
        // TODO: canvas.backgroundColor
        context.setFillColor(backgroundColor.cgColor)
        context.fill(bounds)
        
        switch dataSource.canvas.editMode {
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
        guard let dataSource = self.dataSource else {
            fatalError()
        }
        guard let delegate = self.delegate else {
            fatalError()
        }
        if allTouches.count == 1 {
            let touch = touches.first!
            let location = touch.location(in: self)
            switch dataSource.canvas.editMode {
            case .draw:
                delegate.updateCurrentVectorPath(point: location)
            case .select:
                if let selectedClosedPathView = self.selectedClosedPathView {
                    let selectedClosedPathViewLocation = touch.location(in: selectedClosedPathView)
                    let anchorType = selectedClosedPathView.resizeAnchorType(location: selectedClosedPathViewLocation)
                    delegate.updateClosedPathViewSelectedResizeAnchorType(anchorType: anchorType)
                    if selectedClosedPathView.frame.contains(location) == false, dataSource.canvas.closedPathViewSelectedResizeAnchorType == .none {
                        self.removeSelectedVectorPathView()
                        delegate.updatePathSelection(point: location)
                    }
                } else {
                    delegate.updatePathSelection(point: location)
                }
                delegate.updateStartPathTranslation(point: location)
                delegate.updateCurrentPathTranslation(point: location)
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
        guard let dataSource = self.dataSource else {
            fatalError()
        }
        guard let delegate = self.delegate else {
            fatalError()
        }
        if allTouches.count == 1 {
            let touch = touches.first!
            let location = touch.location(in: self)
            switch dataSource.canvas.editMode {
            case .draw:
                delegate.updateCurrentVectorPath(point: location)
            case .select:
                delegate.updateCurrentPathTranslation(point: location)
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
        guard let dataSource = self.dataSource else {
            fatalError()
        }
        guard let delegate = self.delegate else {
            fatalError()
        }
        if allTouches.count == 1 {
            switch dataSource.canvas.editMode {
            case .draw:
                delegate.closeCurrentVectorPath()
            case .select:
                delegate.clearTranslationPath()
                
                // TODO: inside method
                if let selectedVectorPath = dataSource.canvas.selectedVectorPath {
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
