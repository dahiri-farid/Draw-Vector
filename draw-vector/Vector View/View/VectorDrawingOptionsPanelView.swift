//
//  VectorDrawingOptionsPanelView.swift
//  draw-vector
//
//  Created by Farid Dahiri on 19.09.2021.
//

import Foundation
import UIKit

protocol VectorDrawingOptionsPanelViewDelegate : NSObject {
    func drawOptionsActionSelected()
    func pathDrawOptionsActionSelected()
}

class VectorDrawingOptionsPanelView : UIView {
    weak var delegate: VectorDrawingOptionsPanelViewDelegate?
    
    @IBOutlet var drawOptionsButton: UIButton?
    @IBOutlet var pathDrawOptionsButton: UIButton?
    
    @IBAction func drawOptionsAction(sender: Any) {
        
    }
    
    @IBAction func pathDrawOptionsAction(sender: Any) {
        
    }
}
