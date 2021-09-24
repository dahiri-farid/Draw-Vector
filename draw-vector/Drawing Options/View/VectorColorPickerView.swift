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
    
    func vectorColorPickerViewDidUpdate(lineColor: UIColor, backgroundColor: UIColor);
}

class VectorColorPickerView: UIView {
    @IBOutlet var colorPickerContainerView: UIView?
    @IBOutlet var segmentedControl: UISegmentedControl?
    let colorPickerView = ColorPicker()
    
    var pathLineInitialColor: UIColor?
    var pathBackgroundInitialColor: UIColor?
    var pathLineColor: UIColor?
    var pathBackgroundColor: UIColor?
    
    weak var delegate: VectorColorPickerViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        guard let colorPickerContainerView = self.colorPickerContainerView else {
            fatalError()
        }
        guard let segmentedControl = self.segmentedControl else {
            fatalError()
        }
        segmentedControl.selectedSegmentIndex = 0
        colorPickerView.translatesAutoresizingMaskIntoConstraints = false
        colorPickerContainerView.addSubview(self.colorPickerView)
        colorPickerView.addTarget(self, action: #selector(self.handleColorChanged(picker:)), for: .valueChanged)
        colorPickerView.autoPinEdgesToSuperviewEdges()
        
        segmentedControl.insertSegment(withTitle: "Background", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "Line", at: 1, animated: false)
    }
    
    @objc func handleColorChanged(picker: ColorPicker) {
        guard let segmentedControl = segmentedControl else {
            return
        }
        if segmentedControl.selectedSegmentIndex == 0 {
            self.pathBackgroundColor = picker.color
        } else if segmentedControl.selectedSegmentIndex == 1 {
            self.pathLineColor = picker.color
        } else {
            fatalError()
        }
        guard let pathBackgroundColor = pathBackgroundColor else {
            fatalError()
        }
        guard let pathLineColor = pathLineColor else {
            fatalError()
        }
        guard let delegate = self.delegate else {
            fatalError()
        }

        delegate.vectorColorPickerViewDidUpdate(lineColor: pathLineColor, backgroundColor: pathBackgroundColor)
    }
    
    func configure(backgroundColor: UIColor, lineColor: UIColor) {
        self.pathBackgroundInitialColor = backgroundColor
        self.pathLineInitialColor = lineColor
        self.pathBackgroundColor = self.pathBackgroundInitialColor
        self.pathLineColor = self.pathLineInitialColor
        self.colorPickerView.set(color: backgroundColor, colorSpace: .sRGB)
    }

    @IBAction func segmentedControlValueChanged(sender: Any) {
        guard let segmentedControl = segmentedControl else {
            fatalError()
        }
        guard let pathBackgroundColor = pathBackgroundColor else {
            fatalError()
        }
        guard let pathLineColor = pathLineColor else {
            fatalError()
        }
        if segmentedControl.selectedSegmentIndex == 0 {
            self.colorPickerView.set(color: pathBackgroundColor, colorSpace: .sRGB)
        } else if segmentedControl.selectedSegmentIndex == 1 {
            self.colorPickerView.set(color: pathLineColor, colorSpace: .sRGB)
        } else {
            fatalError()
        }
    }
}
