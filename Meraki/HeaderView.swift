//
//  HeaderView.swift
//  Meraki
//
//  Created by Alberto Segura Sanchez on 04/05/22.
//

import UIKit

class HeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = UIColor.clear
    }
    
    override func draw(_ rect: CGRect){
        
        let path: UIBezierPath = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: 80, height: 80))
        
        path.close()
        UIColor(named: "Blue4")?.set()
        path.fill()
    }
}
