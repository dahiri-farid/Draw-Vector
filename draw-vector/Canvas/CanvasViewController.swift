//
//  CanvasViewController.swift
//  draw-vector
//
//  Created by Farid Dahiri on 17.09.2021.
//

import UIKit

class CanvasViewController: UIViewController, CanvasEditPanelViewDelegate, CanvasViewDataSource, CanvasViewDelegate, DrawingOptionsPanelViewDelegate {
    let panelView: CanvasEditModePanelView? = CanvasEditModePanelView.loadFromNib()
    let drawOptionsPanelView: DrawingOptionsPanelView? = DrawingOptionsPanelView.loadFromNib()
    let vectorView = CanvasView()
    
    var viewModel: CanvasViewControllerModel?
    var canvas: ICanvas {
        get {
            return self.viewModel!.canvas
        }
    }

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.vectorView.dataSource = self
        self.vectorView.delegate = self
        self.view.addSubview(self.vectorView)
        self.setupPanelView()
        self.setupDrawOptionsPanelView()
        
        // TODO: move this outside soon
        self.configure(canvasController: CanvasController())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.vectorView.frame = self.view.bounds
        self.update()
    }
    
    // MARK: Public
    func configure(canvasController: CanvasController) {
        self.viewModel = CanvasViewControllerModel(canvasController: canvasController)
        self.update()
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
        guard let panelView = panelView else {
            fatalError()
        }
        guard let drawOptionsPanelView = drawOptionsPanelView else {
            fatalError()
        }
        panelView.viewMode = viewModel.canvas.editMode
        drawOptionsPanelView.canvas = viewModel.canvas
        
        self.vectorView.update()
        drawOptionsPanelView.update()
    }
    
    // MARK: VectorPanelViewDelegate
    func drawActionSelected() {
        guard let viewModel = self.viewModel else {
            fatalError()
        }
        viewModel.updateMode(mode: .draw)
        self.update()
    }
    
    func selectActionSelected() {
        guard let viewModel = self.viewModel else {
            fatalError()
        }
        viewModel.updateMode(mode: .select)
        self.update()
    }
    
    // MARK: CanvasViewDelegate
    func reset() {
        guard let viewModel = self.viewModel else {
            fatalError()
        }
        viewModel.reset()
    }
    
    func removeSelectedVectorPath() {
        guard let viewModel = self.viewModel else {
            fatalError()
        }
        viewModel.removeSelectedVectorPath()
    }
    
    func updateCurrentVectorPath(point: CGPoint) {
        guard let viewModel = self.viewModel else {
            fatalError()
        }
        viewModel.updateCurrentVectorPath(point: point)
    }
    
    func closeCurrentVectorPath() {
        guard let viewModel = self.viewModel else {
            fatalError()
        }
        viewModel.closeCurrentVectorPath()
    }
    
    func updatePathSelection(point: CGPoint) {
        guard let viewModel = self.viewModel else {
            fatalError()
        }
        viewModel.updatePathSelection(point: point)
    }
    
    func updateClosedPathViewSelectedResizeAnchorType(anchorType: ClosedPathSelectionViewAnchorType) {
        guard let viewModel = self.viewModel else {
            fatalError()
        }
        viewModel.updateClosedPathViewSelectedResizeAnchorType(anchorType: anchorType)
    }
    
    func clearTranslationPath() {
        guard let viewModel = self.viewModel else {
            fatalError()
        }
        viewModel.clearTranslationPath()
    }
    
    func updateCurrentPathTranslation(point: CGPoint) {
        guard let viewModel = self.viewModel else {
            fatalError()
        }
        viewModel.updateCurrentPathTranslation(point: point)
    }
    
    func updateStartPathTranslation(point: CGPoint) {
        guard let viewModel = self.viewModel else {
            fatalError()
        }
        viewModel.updateStartPathTranslation(point: point)
    }
    
    func selectClosedVectorPath(atPoint: CGPoint) -> Bool {
        guard let viewModel = self.viewModel else {
            fatalError()
        }
        return viewModel.selectClosedVectorPath(atPoint: atPoint)
    }
    
    // MARK: VectorDrawingOptionsPanelViewDelegate
    func drawingOptionsPanelViewCanvasSelected(view: DrawingOptionsPanelView) {
        
    }
    
    func drawingOptionsPanelViewOptionsSelected(view: DrawingOptionsPanelView) {
        
    }
}

