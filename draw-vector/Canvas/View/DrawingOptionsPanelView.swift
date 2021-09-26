//
//  DrawingOptionsPanelView.swift
//  draw-vector
//
//  Created by Farid Dahiri on 19.09.2021.
//

import Foundation
import UIKit

protocol DrawingOptionsPanelViewDelegate : NSObject {
    func drawingOptionsPanelViewOptionsSelected(view: DrawingOptionsPanelView)
    func drawingOptionsPanelViewCanvasSelected(view: DrawingOptionsPanelView)
}

class DrawingOptionsPanelView : UIView {
    weak var delegate: DrawingOptionsPanelViewDelegate?
    var canvas: ICanvas?
    
    @IBOutlet var drawOptionsButton: UIButton?
    @IBOutlet var canvasOptionsButton: UIButton?
    
    // MARK: public
    func update() {
        guard let canvas = self.canvas else {
            fatalError()
        }
        guard let drawOptionsButton = self.drawOptionsButton else {
            fatalError()
        }
        guard let canvasOptionsButton = self.canvasOptionsButton else {
            fatalError()
        }

        switch canvas.editMode {
        case .draw:
            drawOptionsButton.isEnabled = false
            canvasOptionsButton.isEnabled = true
        case .select:
            drawOptionsButton.isEnabled = canvas.selectedVectorPath != nil
            canvasOptionsButton.isEnabled = true
        }
    }
    
    @IBAction func drawOptionsAction(sender: Any) {
        guard let delegate = self.delegate else {
            fatalError()
        }
        delegate.drawingOptionsPanelViewOptionsSelected(view: self)
    }
    
    @IBAction func canvasOptionsAction(sender: Any) {
        guard let delegate = self.delegate else {
            fatalError()
        }
        delegate.drawingOptionsPanelViewCanvasSelected(view: self)
    }
}
