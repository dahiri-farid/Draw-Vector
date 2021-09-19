//
//  Nib+View.swift
//  draw-vector
//
//  Created by Farid Dahiri on 19.09.2021.
//

import UIKit

extension UIView {
    
    class func loadFromNib<T: UIView>() -> T? { 
        guard let nib = Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil) else {
            return nil
        }
        return nib.first as? T
    }
}
