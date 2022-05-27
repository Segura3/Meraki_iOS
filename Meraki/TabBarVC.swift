//
//  TabBarVC.swift
//  Meraki
//
//  Created by Alberto Segura Sanchez on 03/05/22.
//

import UIKit

class TabBarVC: UITabBar {

    private var shapeLayer: CALayer?
    
    private func addShape(rect: CGRect){
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath(rect: rect)
        shapeLayer.strokeColor = UIColor.clear.cgColor
        shapeLayer.fillColor = UIColor(named: "Blue3")?.cgColor
        shapeLayer.lineWidth = 1
        
        shapeLayer.shadowOffset = CGSize(width: 0, height: 0)
        shapeLayer.shadowRadius = 10
        shapeLayer.shadowColor = UIColor(named: "Blue3")?.cgColor
        shapeLayer.shadowOpacity = 0.3
        
        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        }else{
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        
        self.shapeLayer = shapeLayer
    }
    
    override func draw(_ rect: CGRect) {
        
        let r = rect
        
        self.addShape(rect: r)
        
        self.unselectedItemTintColor = UIColor.black
        self.tintColor = UIColor(named: "Blue600")
    }
    
    func createPath(rect: CGRect) -> CGPath {
        /*let height: CGFloat = 15
        let path = UIBezierPath()
        let centerWidth = self.frame.width / 2
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addQuadCurve(to: CGPoint(x: self.frame.width, y: 0), controlPoint: CGPoint(x: centerWidth, y: height))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()*/
        
        let rectWidth = rect.width - 35
        let rectHeight = rect.height - 25
        
        let xf: CGFloat = (self.frame.width - rectWidth) / 2
        let yf: CGFloat = (self.frame.height - rectHeight) / 2 - 15
        
        let rect = CGRect(x: xf, y: yf, width: rectWidth, height: rectHeight)
        let path: CGPath = UIBezierPath(roundedRect: rect, cornerRadius: 50).cgPath
               
        return path
    }
}
