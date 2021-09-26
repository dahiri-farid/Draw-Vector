//
//  VectorDrawingOptionsPanelView.swift
//  draw-vector
//
//  Created by Farid Dahiri on 19.09.2021.
//

import Foundation
import UIKit

protocol VectorDrawingOptionsPanelViewDelegate : NSObject {
    func vectorDrawingOptionsPanelViewOptionsSelected(view: VectorDrawingOptionsPanelView)
    func vectorDrawingOptionsPanelViewCanvasSelected(view: VectorDrawingOptionsPanelView)
}

class VectorDrawingOptionsPanelView : UIView {
    weak var delegate: VectorDrawingOptionsPanelViewDelegate?
    
    @IBOutlet var drawOptionsButton: UIButton?
    @IBOutlet var canvasOptionsButton: UIButton?
    
    @IBAction func drawOptionsAction(sender: Any) {
        guard let delegate = self.delegate else {
            fatalError()
        }
        delegate.vectorDrawingOptionsPanelViewOptionsSelected(view: self)
    }
    
    @IBAction func canvasOptionsAction(sender: Any) {
        guard let delegate = self.delegate else {
            fatalError()
        }
        delegate.vectorDrawingOptionsPanelViewCanvasSelected(view: self)
    }
}
