//
//  OutlineSQBoxView.swift
//  Meraki
//
//  Created by Alberto Segura Sanchez on 19/05/22.
//

import UIKit

class OutlineSQBoxView: UIView {

    //Outline square box with 0 rounded corners

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = UIColor.clear
    }
    
    override func draw(_ rect: CGRect){
        
        //let path: UIBezierPath = UIBezierPath(roundedRect: rect.inset(by: UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)), byRoundingCorners: [.bottomLeft, .bottomRight, .topRight, .topLeft], cornerRadii: CGSize(width: 10, height: 10))
        let path: UIBezierPath = UIBezierPath(rect: rect)
        
        path.close()
        UIColor(named: "Blue2")?.setStroke()
        path.lineWidth = 2
        path.stroke()
    }
}
