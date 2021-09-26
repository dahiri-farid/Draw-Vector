//
//  DrawOptionsViewController.swift
//  draw-vector
//
//  Created by Farid Dahiri on 19.09.2021.
//

import PureLayout
import UIKit

class DrawOptionsViewController : UIViewController, ColorPickerViewDelegate {
    private var colorPickerView: ColorPickerView? = ColorPickerView.loadFromNib()
    var didSelectColor: ((UIColor) -> ())?
    
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
    
    func configure(backgroundColor: UIColor) {
        guard let colorPickerView = self.colorPickerView else {
            fatalError()
        }
        colorPickerView.configure(backgroundColor: backgroundColor)
    }
    
    // MARK: VectorColorPickerViewDelegate
    func colorPickerViewDidUpdate(backgroundColor: UIColor) {
        guard let didSelectColor = self.didSelectColor else {
            fatalError()
        }
        didSelectColor(backgroundColor)
    }
}
