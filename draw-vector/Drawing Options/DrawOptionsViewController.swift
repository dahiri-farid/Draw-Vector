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
    private var viewModel: DrawOptionsViewControllerModel?
    
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
    
    func configure(canvasController: CanvasController) {
        guard let colorPickerView = self.colorPickerView else {
            fatalError()
        }
        
        let viewModel = DrawOptionsViewControllerModel(canvasController: canvasController)
        self.viewModel = viewModel
        colorPickerView.configure(backgroundColor: viewModel.backgroundColor)
    }
    
    // MARK: VectorColorPickerViewDelegate
    func colorPickerViewDidUpdate(backgroundColor: UIColor) {
        guard let viewModel = self.viewModel else {
            fatalError()
        }
        viewModel.updateBackgroundColor(color: backgroundColor)
    }
}
