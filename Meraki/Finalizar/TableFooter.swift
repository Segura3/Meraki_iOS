//
//  TableFooter.swift
//  Meraki
//
//  Created by Alberto Segura Sanchez on 09/05/22.
//

import UIKit

class TableFooter: UITableViewHeaderFooterView {

    static let identifier = "TableFooter"
    
    var viewDetalles: Box2View!
    var subtotalLabel: UILabel!
    var subtotalQty: UILabel!
    var envioLabel: UILabel!
    var envioQty: UILabel!
    var descuentoLabel: UILabel!
    var descuentoQty: UILabel!
    var totalLabel: UILabel!
    var totalQty: UILabel!
    var vstack: UIStackView!
    var hstack1: UIStackView!
    var hstack2: UIStackView!
    var hstack3: UIStackView!
    var hstack4: UIStackView!
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        subtotalLabel = UILabel()
        subtotalLabel.text = "Subtotal (8 Productos)"
        subtotalLabel.font = UIFont(name: "OpenSans-Medium", size: 16)
        subtotalLabel.textAlignment = .left
        
        subtotalQty = UILabel()
        subtotalQty.text = "$ 980.00"
        subtotalQty.font = UIFont(name: "OpenSans-Medium", size: 16)
        subtotalQty.textAlignment = .right
        
        hstack1 = UIStackView()
        hstack1.axis = NSLayoutConstraint.Axis.horizontal
        hstack1.distribution = .equalSpacing
        hstack1.spacing = 1.0
        hstack1.addArrangedSubview(subtotalLabel)
        hstack1.addArrangedSubview(subtotalQty)
        
        envioLabel = UILabel()
        envioLabel.text = "Costo de envio"
        envioLabel.font = UIFont(name: "OpenSans-Medium", size: 16)
        envioLabel.textAlignment = .left
        
        envioQty = UILabel()
        envioQty.text = "Gratis"
        envioQty.font = UIFont(name: "OpenSans-Medium", size: 16)
        envioQty.textAlignment = .right
        
        hstack2 = UIStackView()
        hstack2.axis = NSLayoutConstraint.Axis.horizontal
        hstack2.distribution = .equalSpacing
        hstack2.spacing = 1.0
        hstack2.addArrangedSubview(envioLabel)
        hstack2.addArrangedSubview(envioQty)
        
        descuentoLabel = UILabel()
        descuentoLabel.text = "Descuento"
        descuentoLabel.font = UIFont(name: "OpenSans-Medium", size: 16)
        descuentoLabel.textAlignment = .left
        
        descuentoQty = UILabel()
        descuentoQty.text = "$ 0.00"
        descuentoQty.font = UIFont(name: "OpenSans-Medium", size: 16)
        descuentoQty.textAlignment = .right
        
        hstack3 = UIStackView()
        hstack3.axis = NSLayoutConstraint.Axis.horizontal
        hstack3.distribution = .equalSpacing
        hstack3.spacing = 1.0
        hstack3.addArrangedSubview(descuentoLabel)
        hstack3.addArrangedSubview(descuentoQty)
        
        totalLabel = UILabel()
        totalLabel.text = "Total (IVA incluido)"
        totalLabel.font = UIFont(name: "OpenSans-Medium", size: 16)
        totalLabel.textAlignment = .left
        
        totalQty = UILabel()
        totalQty.text = "$ 980.00"
        totalQty.font = UIFont(name: "OpenSans-Medium", size: 16)
        totalQty.textAlignment = .right
        
        hstack4 = UIStackView()
        hstack4.axis = NSLayoutConstraint.Axis.horizontal
        hstack4.distribution = .equalSpacing
        hstack4.spacing = 1.0
        hstack4.addArrangedSubview(totalLabel)
        hstack4.addArrangedSubview(totalQty)
        
        vstack = UIStackView()
        vstack.axis = NSLayoutConstraint.Axis.vertical
        vstack.distribution = .equalSpacing
        vstack.spacing = 1.0
        vstack.addArrangedSubview(hstack1)
        vstack.addArrangedSubview(hstack2)
        vstack.addArrangedSubview(hstack3)
        vstack.addArrangedSubview(hstack4)
        vstack.translatesAutoresizingMaskIntoConstraints = false
        
        viewDetalles = Box2View()
        viewDetalles.addSubview(vstack)
        
        contentView.addSubview(viewDetalles)
        
        contentView.backgroundColor = .white
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        viewDetalles.frame = CGRect(x: 20, y: 10, width: contentView.frame.width-40, height: 110)
        
        NSLayoutConstraint.activate([
            vstack.topAnchor.constraint(equalTo: viewDetalles.topAnchor, constant: 10),
            vstack.centerXAnchor.constraint(equalTo: viewDetalles.centerXAnchor),
            vstack.widthAnchor.constraint(equalTo: viewDetalles.widthAnchor, constant: -32),
            vstack.bottomAnchor.constraint(equalTo: viewDetalles.bottomAnchor, constant: -10)
        ])
    }
        
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
