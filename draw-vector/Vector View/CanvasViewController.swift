//
//  CanvasViewController.swift
//  draw-vector
//
//  Created by Farid Dahiri on 17.09.2021.
//

import UIKit

class CanvasViewController: UIViewController, CanvasEditPanelViewDelegate, CanvasViewDelegate, VectorDrawingOptionsPanelViewDelegate {
    let panelView: CanvasEditModePanelView? = CanvasEditModePanelView.loadFromNib()
    let drawOptionsPanelView: VectorDrawingOptionsPanelView? = VectorDrawingOptionsPanelView.loadFromNib()
    let vectorView = CanvasView()
    
    var viewModel: CanvasViewControllerModel?
    var canvas: ICanvas {
        get {
            return self.viewModel!.canvasController.canvas
        }
    }

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // TODO: move this outside soon
        self.configure(canvasController: CanvasController())
        self.vectorView.delegate = self
        self.view.addSubview(self.vectorView)
        self.setupPanelView()
        self.setupDrawOptionsPanelView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.vectorView.frame = self.view.bounds
        self.update()
    }
    
    // MARK: Public
    func configure(canvasController: CanvasController) {
        self.viewModel = CanvasViewControllerModel(canvasController: canvasController)
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
        guard let viewModel = self.viewModel else {
            fatalError()
        }
        self.panelView?.viewMode = viewModel.viewMode
        self.vectorView.editMode = viewModel.viewMode
    }
    
    // MARK: VectorPanelViewDelegate
    func drawActionSelected() {
        guard let viewModel = self.viewModel else {
            fatalError()
        }
        viewModel.viewMode = .draw
        self.update()
    }
    
    func selectActionSelected() {
        guard let viewModel = self.viewModel else {
            fatalError()
        }
        viewModel.viewMode = .select
        self.update()
    }
    
    // MARK: CanvasViewDelegate
    func reset() {
        
    }
    
    func drawCurrentVectorPath() {
        
    }
    
    func updateSelectedVectorPathLayout() {
        
    }
    
    func drawClosedVectorPathCollection() {
        
    }
    
    func removeSelectedVectorPath() {
        
    }
    
    // MARK: VectorDrawingOptionsPanelViewDelegate
    func vectorDrawingOptionsPanelViewCanvasSelected(view: VectorDrawingOptionsPanelView) {
        
    }
    
    func vectorDrawingOptionsPanelViewOptionsSelected(view: VectorDrawingOptionsPanelView) {
    }
}

