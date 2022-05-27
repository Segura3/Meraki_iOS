//
//  TableHeader.swift
//  Meraki
//
//  Created by Alberto Segura Sanchez on 16/05/22.
//

import UIKit

class TableHeader: UITableViewHeaderFooterView {
    
    static let identifier = "TableHeader"
    
    var boxDirEntrega: OutlineBoxView!
    var dirEntrega: UILabel!
    var formaPago: UILabel!
    var boxFormaPago: OutlineBoxView!
    var hstackDir: UIStackView!
    var imgDir: UIImageView!
    var txtDir: UILabel!
    var btnEditarDir: UIButton!
    var hstackPago: UIStackView!
    var imgPago: UIImageView!
    var txtPago: UILabel!
    var btnEditarPago: UIButton!
    
    override init(reuseIdentifier: String?) {
        super .init(reuseIdentifier: reuseIdentifier)
        
        dirEntrega = UILabel()
        dirEntrega.text = "Dirección de entrega"
        dirEntrega.font = UIFont(name: "Domine-Medium", size: 16)
        dirEntrega.textColor = UIColor(named: "Blue700")
        dirEntrega.textAlignment = .left
        dirEntrega.translatesAutoresizingMaskIntoConstraints = false
        
        imgDir = UIImageView(image: UIImage(named: "Location"))
        imgDir.frame.size.height = 20
        imgDir.frame.size.width = 20
        imgDir.contentMode = .scaleAspectFit
        imgDir.translatesAutoresizingMaskIntoConstraints = false
        
        txtDir = UILabel()
        txtDir.text = "Alberto Segura Sánchez\nCalle Independencia No. 4\nCoyoacan, 07979\nCiudad de México, México"
        txtDir.font = UIFont(name: "Domine-Regular", size: 14)
        txtDir.textColor = .black
        txtDir.textAlignment = .left
        txtDir.numberOfLines = 0
        
        btnEditarDir = UIButton(type: .system)
        btnEditarDir.frame.size.width = 20
        btnEditarDir.frame.size.height = 20
        btnEditarDir.setBackgroundImage(UIImage(named: "Edit"), for: .normal)
        btnEditarDir.translatesAutoresizingMaskIntoConstraints = false
        
        hstackDir = UIStackView()
        hstackDir.axis = NSLayoutConstraint.Axis.horizontal
        hstackDir.distribution = .fillProportionally
        hstackDir.alignment = .center
        hstackDir.spacing = 10
        hstackDir.addArrangedSubview(imgDir)
        hstackDir.addArrangedSubview(txtDir)
        hstackDir.addArrangedSubview(btnEditarDir)
        hstackDir.translatesAutoresizingMaskIntoConstraints = false
        
        boxDirEntrega = OutlineBoxView()
        boxDirEntrega.translatesAutoresizingMaskIntoConstraints = false
        boxDirEntrega.addSubview(dirEntrega)
        boxDirEntrega.addSubview(hstackDir)
        
        formaPago = UILabel()
        formaPago.text = "Forma de Pago"
        formaPago.font = UIFont(name: "Domine-Medium", size: 16)
        formaPago.textColor = UIColor(named: "Blue700")
        formaPago.textAlignment = .left
        formaPago.translatesAutoresizingMaskIntoConstraints = false
        
        imgPago = UIImageView(image: UIImage(named: "Card"))
        imgPago.frame.size.height = 20
        imgPago.frame.size.width = 20
        imgPago.contentMode = .scaleAspectFit
        imgPago.translatesAutoresizingMaskIntoConstraints = false
        
        txtPago = UILabel()
        txtPago.text = "Tarjeta termina en 1234"
        txtPago.font = UIFont(name: "Domine-Regular", size: 14)
        txtPago.textColor = .black
        txtPago.textAlignment = .left
        txtPago.numberOfLines = 0
        
        btnEditarPago = UIButton(type: .system)
        btnEditarPago.frame.size.width = 20
        btnEditarPago.frame.size.height = 20
        btnEditarPago.setBackgroundImage(UIImage(named: "Edit"), for: .normal)
        btnEditarPago.translatesAutoresizingMaskIntoConstraints = false
        
        hstackPago = UIStackView()
        hstackPago.axis = NSLayoutConstraint.Axis.horizontal
        hstackPago.distribution = .fillProportionally
        hstackPago.alignment = .center
        hstackPago.spacing = 10
        hstackPago.addArrangedSubview(imgPago)
        hstackPago.addArrangedSubview(txtPago)
        hstackPago.addArrangedSubview(btnEditarPago)
        hstackPago.translatesAutoresizingMaskIntoConstraints = false
        
        boxFormaPago = OutlineBoxView()
        boxFormaPago.addSubview(formaPago)
        boxFormaPago.addSubview(hstackPago)
        boxFormaPago.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(boxDirEntrega)
        contentView.addSubview(boxFormaPago)
        
        contentView.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            boxDirEntrega.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            boxDirEntrega.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            boxDirEntrega.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            boxDirEntrega.heightAnchor.constraint(equalToConstant: 120)
        ])
        
        NSLayoutConstraint.activate([
            dirEntrega.topAnchor.constraint(equalTo: boxDirEntrega.topAnchor, constant: 10),
            dirEntrega.leadingAnchor.constraint(equalTo: boxDirEntrega.leadingAnchor, constant: 20),
            dirEntrega.trailingAnchor.constraint(equalTo: boxDirEntrega.trailingAnchor, constant: -10),
            dirEntrega.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            hstackDir.topAnchor.constraint(equalTo: dirEntrega.bottomAnchor, constant: 5),
            hstackDir.leadingAnchor.constraint(equalTo: boxDirEntrega.leadingAnchor, constant: 20),
            hstackDir.trailingAnchor.constraint(equalTo: boxDirEntrega.trailingAnchor, constant: -20),
            hstackDir.heightAnchor.constraint(equalToConstant: 70),
            imgDir.heightAnchor.constraint(equalToConstant: 30),
            imgDir.widthAnchor.constraint(equalToConstant: 30),
            btnEditarDir.widthAnchor.constraint(equalToConstant: 20),
            btnEditarDir.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            boxFormaPago.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            boxFormaPago.topAnchor.constraint(equalTo: boxDirEntrega.bottomAnchor, constant: 10),
            boxFormaPago.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            boxFormaPago.heightAnchor.constraint(equalToConstant: 75)
        ])
        
        NSLayoutConstraint.activate([
            formaPago.topAnchor.constraint(equalTo: boxFormaPago.topAnchor, constant: 10),
            formaPago.leadingAnchor.constraint(equalTo: boxFormaPago.leadingAnchor, constant: 20),
            formaPago.trailingAnchor.constraint(equalTo: boxFormaPago.trailingAnchor, constant: -10),
            formaPago.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            hstackPago.topAnchor.constraint(equalTo: formaPago.bottomAnchor, constant: 5),
            hstackPago.leadingAnchor.constraint(equalTo: boxFormaPago.leadingAnchor, constant: 20),
            hstackPago.trailingAnchor.constraint(equalTo: boxFormaPago.trailingAnchor, constant: -20),
            hstackPago.heightAnchor.constraint(equalToConstant: 30),
            imgPago.heightAnchor.constraint(equalToConstant: 30),
            imgPago.widthAnchor.constraint(equalToConstant: 30),
            btnEditarPago.widthAnchor.constraint(equalToConstant: 20),
            btnEditarPago.heightAnchor.constraint(equalToConstant: 20)
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
