//
//  ShadowBoxView.swift
//  Meraki
//
//  Created by Alberto Segura Sanchez on 23/05/22.
//

import UIKit

class ShadowBoxView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var setupShadowDone: Bool = false
        
        public func setupShadow() {
            if setupShadowDone { return }
            self.layer.cornerRadius = 8
            self.layer.shadowOffset = CGSize(width: 0, height: 3)
            self.layer.shadowRadius = 3
            self.layer.shadowOpacity = 0.3
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 8, height:8)).cgPath
            self.layer.shouldRasterize = true
            self.layer.rasterizationScale = UIScreen.main.scale
        
            setupShadowDone = true
        }

        override func layoutSubviews() {
            super.layoutSubviews()
            setupShadow()
        }
}
