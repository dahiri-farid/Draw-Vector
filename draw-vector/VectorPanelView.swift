//
//  VectorPanelView.swift
//  draw-vector
//
//  Created by Farid Dahiri on 19.09.2021.
//

import Foundation
import UIKit

protocol VectorPanelViewDelegate : NSObject {
    
    func drawActionSelected()
    func drawOptionsActionSelected()
    func moveActionSelected()
    func scaleActionSelected()
    func editActionSelected()
    func deleteActionSelected()
}

class VectorPanelView : UIView {
    weak var delegate: VectorPanelViewDelegate?
    
    @IBOutlet var drawButton: UIButton?
    @IBOutlet var drawOptionsButton: UIButton?
    @IBOutlet var moveButton: UIButton?
    @IBOutlet var scaleButton: UIButton?
    @IBOutlet var editButton: UIButton?
    @IBOutlet var deleteButton: UIButton?
    
    var viewMode: VectorViewMode = .draw {
        didSet {
            self.unselectAllButtons()
            switch viewMode {
            case .draw:
                self.drawButton?.isSelected = true
            case .drawOptions:
                self.drawOptionsButton?.isSelected = true
            case .move:
                self.moveButton?.isSelected = true
            case .edit:
                self.editButton?.isSelected = true
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
    
    @IBAction func drawOptionsAction(sender: Any) {
        guard let delegate = self.delegate else {
            return
        }
        delegate.drawOptionsActionSelected()
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
    
    @IBAction func editAction(sender: Any) {
        guard let delegate = self.delegate else {
            return
        }
        delegate.editActionSelected()
    }
    
    @IBAction func deleteAction(sender: Any) {
        guard let delegate = self.delegate else {
            return
        }
        delegate.deleteActionSelected()
    }
    
    func unselectAllButtons() {
        self.drawButton?.isSelected = false
        self.drawOptionsButton?.isSelected = false
        self.moveButton?.isSelected = false
        self.scaleButton?.isSelected = false
        self.editButton?.isSelected = false
        self.deleteButton?.isSelected = false
    }
}
