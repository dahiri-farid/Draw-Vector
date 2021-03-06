//
//  ClosedPathSelectionView.swift
//  draw-vector
//
//  Created by Farid Dahiri on 21.09.2021.
//

import Foundation
import UIKit
import PureLayout

enum ClosedPathSelectionViewAnchorType {
    case none
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight
}

class ClosedPathSelectionView : UIView {
    private(set) var initialFrame: CGRect
    let topLeftCornerResizeAnchor = UIView()
    let topRightCornerResizeAnchor = UIView()
    let bottomLeftCornerResizeAnchor = UIView()
    let bottomRightCornerResizeAnhcor = UIView()
    
    let closedPath: ClosedVectorPath
    let dashedBorderLayer = CAShapeLayer()
    
    init(closedPath: ClosedVectorPath) {
        self.closedPath = closedPath
        self.initialFrame = self.closedPath.bezierPath.bounds
        super.init(frame: self.closedPath.bezierPath.bounds)
        
        let anchorSide: CGFloat = 20
        let anchorSize = CGSize(width: anchorSide, height: anchorSide)
        self.topLeftCornerResizeAnchor.backgroundColor = .blue
        self.topLeftCornerResizeAnchor.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.topLeftCornerResizeAnchor)
        self.topLeftCornerResizeAnchor.autoPinEdge(toSuperviewEdge: .leading, withInset: -(anchorSide / 2))
        self.topLeftCornerResizeAnchor.autoPinEdge(toSuperviewEdge: .top, withInset: -(anchorSide / 2))
        self.topLeftCornerResizeAnchor.autoSetDimensions(to: anchorSize)
        self.topLeftCornerResizeAnchor.isUserInteractionEnabled = true
        
        self.topRightCornerResizeAnchor.backgroundColor = .blue
        self.topRightCornerResizeAnchor.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.topRightCornerResizeAnchor)
        self.topRightCornerResizeAnchor.autoPinEdge(toSuperviewEdge: .trailing, withInset: -(anchorSide / 2))
        self.topRightCornerResizeAnchor.autoPinEdge(toSuperviewEdge: .top, withInset: -(anchorSide / 2))
        self.topRightCornerResizeAnchor.autoSetDimensions(to: anchorSize)
        self.topRightCornerResizeAnchor.isUserInteractionEnabled = true
        
        self.bottomLeftCornerResizeAnchor.backgroundColor = .blue
        self.bottomLeftCornerResizeAnchor.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.bottomLeftCornerResizeAnchor)
        self.bottomLeftCornerResizeAnchor.autoPinEdge(toSuperviewEdge: .leading, withInset: -(anchorSide / 2))
        self.bottomLeftCornerResizeAnchor.autoPinEdge(toSuperviewEdge: .bottom, withInset: -(anchorSide / 2))
        self.bottomLeftCornerResizeAnchor.autoSetDimensions(to: anchorSize)
        self.bottomLeftCornerResizeAnchor.isUserInteractionEnabled = true
        
        self.bottomRightCornerResizeAnhcor.backgroundColor = .blue
        self.bottomRightCornerResizeAnhcor.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.bottomRightCornerResizeAnhcor)
        self.bottomRightCornerResizeAnhcor.autoPinEdge(toSuperviewEdge: .trailing, withInset: -(anchorSide / 2))
        self.bottomRightCornerResizeAnhcor.autoPinEdge(toSuperviewEdge: .bottom, withInset: -(anchorSide / 2))
        self.bottomRightCornerResizeAnhcor.autoSetDimensions(to: anchorSize)
        self.bottomRightCornerResizeAnhcor.isUserInteractionEnabled = true
        
        self.dashedBorderLayer.fillColor = UIColor.clear.cgColor
        self.dashedBorderLayer.strokeColor = UIColor.blue.cgColor
        self.dashedBorderLayer.lineWidth = 2
        self.dashedBorderLayer.lineJoin = CAShapeLayerLineJoin.round
        self.dashedBorderLayer.lineDashPattern = [6, 6]
        self.layer.addSublayer(self.dashedBorderLayer)
        
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.dashedBorderLayer.frame = self.bounds
        
        self.topLeftCornerResizeAnchor.layer.cornerRadius = self.topLeftCornerResizeAnchor.bounds.width / 2
        self.topRightCornerResizeAnchor.layer.cornerRadius = self.topRightCornerResizeAnchor.bounds.width / 2
        self.bottomLeftCornerResizeAnchor.layer.cornerRadius = self.bottomLeftCornerResizeAnchor.bounds.width / 2
        self.bottomRightCornerResizeAnhcor.layer.cornerRadius = self.bottomRightCornerResizeAnhcor.bounds.width / 2
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)

        let bezierPath = self.closedPath.bezierPath.copy() as! UIBezierPath
        self.closedPath.fillColor.setFill()
        self.closedPath.fillColor.setStroke()
        bezierPath.lineWidth = self.closedPath.strokeWidth
        let pathScale = CGPoint(x: self.bounds.width / bezierPath.bounds.width, y: self.bounds.height / bezierPath.bounds.height)
        bezierPath.apply(CGAffineTransform(scaleX: pathScale.x, y: pathScale.y))
        self.closedPath.bezierPath = bezierPath.copy() as! UIBezierPath
        bezierPath.apply(CGAffineTransform(translationX: -bezierPath.bounds.origin.x, y: -bezierPath.bounds.origin.y))
        bezierPath.fill()
        bezierPath.stroke()
        
        self.dashedBorderLayer.position = CGPoint(x: self.bounds.size.width / 2, y: self.bounds.size.height / 2)
        self.dashedBorderLayer.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: 5).cgPath
        self.dashedBorderLayer.frame = self.bounds
    }
    
    func resizeAnchorType(location: CGPoint) -> ClosedPathSelectionViewAnchorType {
        if self.topLeftCornerResizeAnchor.frame.contains(location) {
            return .topLeft
        } else if self.topRightCornerResizeAnchor.frame.contains(location) {
            return .topRight
        } else if self.bottomLeftCornerResizeAnchor.frame.contains(location) {
            return .bottomLeft
        } else if self.bottomRightCornerResizeAnhcor.frame.contains(location) {
            return .bottomRight
        }
        
        return .none
    }
    
    func updateInitialFrame() {
        self.initialFrame = self.closedPath.bezierPath.bounds
    }
}
