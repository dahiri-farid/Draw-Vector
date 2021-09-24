//
//  VectorPath.swift
//  draw-vector
//
//  Created by Farid Dahiri on 19.09.2021.
//

import Foundation
import UIKit

class VectorPath {
    var path = [CGPoint]()
    var strokeWidth: CGFloat = 1.0
    var strokeColor = UIColor.black
    var fillColor = UIColor.black
    
    var bezierPath: UIBezierPath? {
        if self.path.count < 1 {
            return nil
        }
        let bezierPath = UIBezierPath()
        let origin = self.path.first!
        bezierPath.move(to: origin)
        
        for point in self.path[1...] {
            bezierPath.addLine(to: point)
        }
        
        bezierPath.close()
        
        return bezierPath
    }
}
