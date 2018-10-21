//
//  MyView.swift
//  IOS10DraggingViewsTutorial
//
//  Created by itrump on 2018/10/21.
//  Copyright © 2018 fengxiaoyang. All rights reserved.
//

import UIKit

class MyView: UIView {

    var lastLocation = CGPoint(x: 0, y: 0)
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(MyView.detectPan(_:)))
        self.gestureRecognizers = [panRecognizer]
        
        let blueValue = CGFloat(Int(arc4random() % 255)) / 255.0
        let greenValue = CGFloat(Int(arc4random() % 255)) / 255.0
        let redValue = CGFloat(Int(arc4random() % 255)) / 255.0
        
        self.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coer:) not implemented.")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.superview?.bringSubview(toFront: self)
        lastLocation = self.center
    }
    
    @objc func detectPan(_ recognizer: UIPanGestureRecognizer)
    {
        let translation =  recognizer.translation(in: self.superview)
        self.center = CGPoint(x: lastLocation.x + translation.x, y: lastLocation.y + translation.y)
    }

}
