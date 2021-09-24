//
//  DrawOptionsViewController.swift
//  draw-vector
//
//  Created by Farid Dahiri on 19.09.2021.
//

import PureLayout
import UIKit

class DrawOptionsViewController : UIViewController, VectorColorPickerViewDelegate {
    
    let colorPickerView = VectorColorPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.colorPickerView.translatesAutoresizingMaskIntoConstraints = false
        self.colorPickerView.delegate = self
        self.view.addSubview(self.colorPickerView)
    }
    
    // MARK: VectorColorPickerViewDelegate
    func vectorColorPickerViewDidUpdate(lineColor: UIColor, backgroundColor: UIColor) {
        
    }
}
