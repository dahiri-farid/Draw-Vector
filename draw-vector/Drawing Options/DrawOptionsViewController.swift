//
//  DrawOptionsViewController.swift
//  draw-vector
//
//  Created by Farid Dahiri on 19.09.2021.
//

import PureLayout
import UIKit

class DrawOptionsViewController : UIViewController, VectorColorPickerViewDelegate {
    
    var colorPickerView: VectorColorPickerView? = VectorColorPickerView.loadFromNib()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let colorPickerView = self.colorPickerView else {
            fatalError()
        }
        colorPickerView.translatesAutoresizingMaskIntoConstraints = false
        colorPickerView.delegate = self
        self.view.addSubview(colorPickerView)
        colorPickerView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
        self.colorPickerView = colorPickerView
    }
    
    // MARK: VectorColorPickerViewDelegate
    func vectorColorPickerViewDidUpdate(backgroundColor: UIColor) {
        
    }
}
