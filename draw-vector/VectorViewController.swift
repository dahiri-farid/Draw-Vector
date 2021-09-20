//
//  VectorViewController.swift
//  draw-vector
//
//  Created by Farid Dahiri on 17.09.2021.
//

import UIKit

class VectorViewController: UIViewController, VectorEditPanelViewDelegate, VectorDrawingOptionsPanelViewDelegate {
    let panelView: VectorEditModePanelView? = VectorEditModePanelView.loadFromNib()
    let drawOptionsPanelView: VectorDrawingOptionsPanelView? = VectorDrawingOptionsPanelView.loadFromNib()
    
    var previousPoint = CGPoint.zero
    let vectorView = VectorView()
    
    let viewModel = VectorViewControllerModel()

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.vectorView)
        self.setupPanelView()
        self.setupDrawOptionsPanelView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.vectorView.frame = self.view.bounds
        self.update()
    }
    
    // MARK: Touches
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self.vectorView)
        
        self.previousPoint = location
        self.vectorView.beginPath(point: location)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self.vectorView)
        
        if !(location.x == self.previousPoint.x && location.y == self.previousPoint.y) {
            self.vectorView.movePath(point: location)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self.vectorView)
        
        if !(location.x == self.previousPoint.x && location.y == self.previousPoint.y) {
            self.vectorView.closePath(point: location)
        }
    }
    
    // MARK: Configuration
    func setupPanelView() {
        guard let panelView = self.panelView else {
            return
        }
        panelView.delegate = self
        self.view.addSubview(panelView)
        panelView.translatesAutoresizingMaskIntoConstraints = false
        let leadingConstraint = NSLayoutConstraint(item: panelView, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: panelView.superview!, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: panelView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: panelView.superview!, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: panelView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 44)
        NSLayoutConstraint.activate([leadingConstraint, verticalConstraint, widthConstraint])
    }
    
    func setupDrawOptionsPanelView() {
        guard let drawOptionsPanelView = self.drawOptionsPanelView else {
            return
        }
        self.view.addSubview(drawOptionsPanelView)
        drawOptionsPanelView.delegate = self
        drawOptionsPanelView.translatesAutoresizingMaskIntoConstraints = false
        let trailingConstraint = NSLayoutConstraint(item: drawOptionsPanelView, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: drawOptionsPanelView.superview!, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: drawOptionsPanelView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: drawOptionsPanelView.superview!, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: drawOptionsPanelView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 44)
        NSLayoutConstraint.activate([trailingConstraint, verticalConstraint, widthConstraint])
    }
    
    func update() {
        self.panelView?.viewMode = self.viewModel.viewMode
        self.vectorView.editMode = self.viewModel.viewMode
    }
    
    // MARK: VectorPanelViewDelegate
    func drawActionSelected() {
        self.viewModel.viewMode = .draw
        self.update()
    }
    
    func moveActionSelected() {
        self.viewModel.viewMode = .move
        self.update()
    }
    
    func scaleActionSelected() {
        self.viewModel.viewMode = .scale
        self.update()
    }

    func deleteActionSelected() {
        self.viewModel.viewMode = .delete
        self.update()
    }
    
    // MARK: VectorDrawingOptionsPanelViewDelegate
    func drawOptionsActionSelected() {
        
    }
    
    func pathDrawOptionsActionSelected() {
        
    }
}

