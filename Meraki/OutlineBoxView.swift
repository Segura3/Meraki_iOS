//
//  OutlineBoxView.swift
//  Meraki
//
//  Created by Alberto Segura Sanchez on 11/05/22.
//

import UIKit

class OutlineBoxView: UIView {
    
    //Outline box with 4 rounded corners 10dp

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = UIColor.clear
    }
    
    override func draw(_ rect: CGRect){
        
        let path: UIBezierPath = UIBezierPath(roundedRect: rect.inset(by: UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)), byRoundingCorners: [.bottomLeft, .bottomRight, .topRight, .topLeft], cornerRadii: CGSize(width: 10, height: 10))
        
        path.close()
        UIColor(named: "Blue2")?.setStroke()
        path.lineWidth = 2
        path.stroke()
    }

}
