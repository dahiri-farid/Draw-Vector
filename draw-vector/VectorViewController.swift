//
//  VectorViewController.swift
//  draw-vector
//
//  Created by Farid Dahiri on 17.09.2021.
//

import UIKit

class VectorViewController: UIViewController {
    
    var previousPoint = CGPoint.zero
    let vectorView = VectorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(self.vectorView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.vectorView.frame = self.view.bounds
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first!
        let location = touch.location(in: self.vectorView)
        self.previousPoint = location
        self.vectorView.beginPath(point: location)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first!
        let location = touch.location(in: self.vectorView)
        
        if !(location.x == self.previousPoint.x && location.y == self.previousPoint.y) {
            self.vectorView.beginPath(point: location)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first!
        let location = touch.location(in: self.vectorView)
        
        if !(location.x == self.previousPoint.x && location.y == self.previousPoint.y) {
            self.vectorView.closePath(point: location)
        }
    }
}

