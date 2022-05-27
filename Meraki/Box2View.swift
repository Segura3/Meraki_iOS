//
//  Box2View.swift
//  Meraki
//
//  Created by Alberto Segura Sanchez on 06/05/22.
//

import UIKit

class Box2View: UIView {
    
    //Filled box with 4 rounded corners 10dp

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = UIColor.clear
    }
    
    override func draw(_ rect: CGRect){
        
        let path: UIBezierPath = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomLeft, .bottomRight, .topRight, .topLeft], cornerRadii: CGSize(width: 10, height: 10))
        
        path.close()
        UIColor(named: "Blue200")?.set()
        path.fill()
    }

}
