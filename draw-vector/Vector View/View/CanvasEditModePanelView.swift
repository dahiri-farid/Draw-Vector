//
//  CanvasEditModePanelView.swift
//  draw-vector
//
//  Created by Farid Dahiri on 19.09.2021.
//

import Foundation
import UIKit

protocol CanvasEditPanelViewDelegate : NSObject {
    func drawActionSelected()
    func selectActionSelected()
}

class CanvasEditModePanelView : UIView {
    weak var delegate: CanvasEditPanelViewDelegate?
    
    @IBOutlet var drawButton: UIButton?
    @IBOutlet var selectButton: UIButton?
    
    var viewMode: CanvasEditMode = .draw {
        didSet {
            self.unselectAllButtons()
            switch viewMode {
            case .draw:
                self.drawButton?.isSelected = true
            case .select:
                self.selectButton?.isSelected = true
            }
        }
    }
    
    @IBAction func drawAction(sender: Any) {
        guard let delegate = self.delegate else {
            return
        }
        delegate.drawActionSelected()
    }
    
    @IBAction func selectAction(sender: Any) {
        guard let delegate = self.delegate else {
            return
        }
        delegate.selectActionSelected()
    }
    
    
    func unselectAllButtons() {
        self.drawButton?.isSelected = false
        self.selectButton?.isSelected = false
    }
}
