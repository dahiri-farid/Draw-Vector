//
//  VectorColorPickerView.swift
//  draw-vector
//
//  Created by Farid Dahiri on 24.09.2021.
//

import UIKit
import Colorful
import PureLayout

protocol VectorColorPickerViewDelegate: NSObject {
    
    func vectorColorPickerViewDidUpdate(backgroundColor: UIColor);
}

class VectorColorPickerView: UIView {
    @IBOutlet var colorPickerContainerView: UIView?
    let colorPickerView = ColorPicker()
    
    var pathBackgroundInitialColor: UIColor?
    var pathBackgroundColor: UIColor?
    
    weak var delegate: VectorColorPickerViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        guard let colorPickerContainerView = self.colorPickerContainerView else {
            fatalError()
        }
        colorPickerView.set(color: UIColor(displayP3Red: 1.0, green: 1.0, blue: 0, alpha: 1), colorSpace: .sRGB)
        colorPickerView.translatesAutoresizingMaskIntoConstraints = false
        colorPickerContainerView.addSubview(self.colorPickerView)
        colorPickerView.addTarget(self, action: #selector(self.handleColorChanged(picker:)), for: .valueChanged)
        colorPickerView.autoPinEdgesToSuperviewEdges()
    }
    
    @objc func handleColorChanged(picker: ColorPicker) {
        guard let delegate = self.delegate else {
            fatalError()
        }
        self.pathBackgroundColor = picker.color

        delegate.vectorColorPickerViewDidUpdate(backgroundColor: picker.color)
    }
    
    func configure(backgroundColor: UIColor) {
        self.pathBackgroundInitialColor = backgroundColor
        self.pathBackgroundColor = self.pathBackgroundInitialColor
        self.colorPickerView.set(color: backgroundColor, colorSpace: .sRGB)
    }
}
