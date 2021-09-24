//
//  VectorEditModePanelView.swift
//  draw-vector
//
//  Created by Farid Dahiri on 19.09.2021.
//

import Foundation
import UIKit

protocol VectorEditPanelViewDelegate : NSObject {
    func drawActionSelected()
    func selectActionSelected()
}

class VectorEditModePanelView : UIView {
    weak var delegate: VectorEditPanelViewDelegate?
    
    @IBOutlet var drawButton: UIButton?
    @IBOutlet var selectButton: UIButton?
    
    var viewMode: VectorViewEditMode = .draw {
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
