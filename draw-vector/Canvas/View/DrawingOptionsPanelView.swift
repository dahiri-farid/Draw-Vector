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
    
    @IBOutlet var drawOptionsButton: UIButton?
    @IBOutlet var canvasOptionsButton: UIButton?
    
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
