//
//  VectorViewController.swift
//  draw-vector
//
//  Created by Farid Dahiri on 17.09.2021.
//

import UIKit

class VectorViewController: UIViewController, VectorPanelViewDelegate {
    let panelView: VectorPanelView? = VectorPanelView.loadFromNib()
    
    var previousPoint = CGPoint.zero
    let vectorView = VectorView()
    
    let viewModel = VectorViewControllerModel()

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.vectorView)
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.vectorView.frame = self.view.bounds
        self.update()
    }
    
    // MARK: Touches
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self.vectorView)
        
        switch self.viewModel.viewMode {
        case .draw:
            self.previousPoint = location
            self.vectorView.beginPath(point: location)
        default: break
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self.vectorView)
        
        switch self.viewModel.viewMode {
        case .draw:
            if !(location.x == self.previousPoint.x && location.y == self.previousPoint.y) {
                self.vectorView.movePath(point: location)
            }
        default: break
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self.vectorView)
        
        switch self.viewModel.viewMode {
        case .draw:
            if !(location.x == self.previousPoint.x && location.y == self.previousPoint.y) {
                self.vectorView.closePath(point: location)
            }
        default: break
        }
    }
    
    // MARK: Configuration
    func update() {
        self.panelView?.viewMode = self.viewModel.viewMode
    }
    
    // MARK: VectorPanelViewDelegate
    func drawActionSelected() {
        self.viewModel.viewMode = .draw
        self.update()
    }
    
    func drawOptionsActionSelected() {
        self.viewModel.viewMode = .drawOptions
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
    
    func editActionSelected() {
        self.viewModel.viewMode = .edit
        self.update()
    }
    
    func deleteActionSelected() {
        self.viewModel.viewMode = .delete
        self.update()
    }
}

