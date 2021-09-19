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
    func moveActionSelected()
    func scaleActionSelected()
    func deleteActionSelected()
}

class VectorEditModePanelView : UIView {
    weak var delegate: VectorEditPanelViewDelegate?
    
    @IBOutlet var drawButton: UIButton?
    @IBOutlet var moveButton: UIButton?
    @IBOutlet var scaleButton: UIButton?
    @IBOutlet var deleteButton: UIButton?
    
    var viewMode: VectorViewEditMode = .draw {
        didSet {
            self.unselectAllButtons()
            switch viewMode {
            case .draw:
                self.drawButton?.isSelected = true
            case .move:
                self.moveButton?.isSelected = true
            case .delete:
                self.deleteButton?.isSelected = true
            case.scale:
                self.scaleButton?.isSelected = true
            }
        }
    }
    
    @IBAction func drawAction(sender: Any) {
        guard let delegate = self.delegate else {
            return
        }
        delegate.drawActionSelected()
    }
    
    @IBAction func moveAction(sender: Any) {
        guard let delegate = self.delegate else {
            return
        }
        delegate.moveActionSelected()
    }
    
    @IBAction func scaleAction(sender: Any) {
        guard let delegate = self.delegate else {
            return
        }
        delegate.scaleActionSelected()
    }
    
    @IBAction func deleteAction(sender: Any) {
        guard let delegate = self.delegate else {
            return
        }
        delegate.deleteActionSelected()
    }
    
    func unselectAllButtons() {
        self.drawButton?.isSelected = false
        self.moveButton?.isSelected = false
        self.scaleButton?.isSelected = false
        self.deleteButton?.isSelected = false
    }
}
