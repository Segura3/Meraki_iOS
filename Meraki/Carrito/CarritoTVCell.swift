//
//  CarritoTVCell.swift
//  Meraki
//
//  Created by Alberto Segura Sanchez on 11/05/22.
//

import UIKit

class CarritoTVCell: UITableViewCell {
    
    static let identifier = "CarritoTVCell"
    
    var viewBox: OutlineBoxView!
    var ivProducto: UIImageView!
    var tvPName: UILabel!
    var tvPPrecio: UILabel!
    var btnBorrar: UIButton!
    var btnAdd: UIButton!
    var btnMinus: UIButton!
    var tvCantidad: UITextField!
    var hstack: UIStackView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        viewBox = OutlineBoxView()
        
        ivProducto = UIImageView()
        ivProducto.frame.size.width = 100
        ivProducto.frame.size.height = 100
        ivProducto.contentMode = .scaleAspectFit
        ivProducto.translatesAutoresizingMaskIntoConstraints = false
        
        tvPName = UILabel()
        tvPName.font = UIFont(name: "Domine-Regular", size: 16)
        tvPName.textAlignment = .left
        tvPName.translatesAutoresizingMaskIntoConstraints = false
        
        tvPPrecio = UILabel()
        tvPPrecio.font = UIFont(name: "Domine-Regular", size: 16)
        tvPPrecio.textAlignment = .right
        tvPPrecio.translatesAutoresizingMaskIntoConstraints = false
        
        btnBorrar = UIButton(type: .system)
        btnBorrar.frame.size.width = 20
        btnBorrar.frame.size.height = 20
        btnBorrar.setBackgroundImage(UIImage(named: "Delete"), for: .normal)
        btnBorrar.translatesAutoresizingMaskIntoConstraints = false
        
        btnAdd = UIButton(type: .system)
        btnAdd.setBackgroundImage(UIImage(named: "Add"), for: .normal)
        btnAdd.addTarget(self, action: #selector(addAction), for: .touchUpInside)
        
        btnMinus = UIButton(type: .system)
        btnMinus.setBackgroundImage(UIImage(named: "Minus"), for: .normal)
        btnMinus.addTarget(self, action: #selector(minusAction), for: .touchUpInside)
        
        tvCantidad = UITextField()
        tvCantidad.text = "0"
        tvCantidad.textAlignment = .center
        tvCantidad.keyboardType = .numberPad
        tvCantidad.borderStyle = .roundedRect
        tvCantidad.font = .systemFont(ofSize: 16, weight: .regular)
        
        hstack = UIStackView()
        hstack.axis = NSLayoutConstraint.Axis.horizontal
        hstack.distribution = .fill
        hstack.alignment = .fill
        hstack.spacing = 1.0
        hstack.addArrangedSubview(btnMinus)
        hstack.addArrangedSubview(tvCantidad)
        hstack.addArrangedSubview(btnAdd)
        hstack.translatesAutoresizingMaskIntoConstraints = false
        
        viewBox.addSubview(ivProducto)
        viewBox.addSubview(btnBorrar)
        viewBox.addSubview(tvPPrecio)
        viewBox.addSubview(tvPName)
        viewBox.addSubview(hstack)
        contentView.addSubview(viewBox)
        contentView.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        viewBox.frame = CGRect(x: 20, y: 5, width: contentView.frame.width-40, height: 120)
        
        NSLayoutConstraint.activate([
            ivProducto.topAnchor.constraint(equalTo: viewBox.topAnchor, constant: 10),
            ivProducto.leadingAnchor.constraint(equalTo: viewBox.leadingAnchor, constant: 10),
            ivProducto.widthAnchor.constraint(equalToConstant: 100),
            ivProducto.bottomAnchor.constraint(equalTo: viewBox.bottomAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            tvPName.topAnchor.constraint(equalTo: viewBox.topAnchor, constant: 10),
            tvPName.leadingAnchor.constraint(equalTo: ivProducto.trailingAnchor, constant: 10),
            tvPName.heightAnchor.constraint(equalToConstant: viewBox.frame.size.height/2),
            tvPName.trailingAnchor.constraint(equalTo: tvPPrecio.leadingAnchor,constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            tvPPrecio.topAnchor.constraint(equalTo: viewBox.topAnchor, constant: 10),
            tvPPrecio.trailingAnchor.constraint(equalTo: viewBox.trailingAnchor, constant: -20),
            tvPPrecio.leadingAnchor.constraint(equalTo: tvPName.trailingAnchor,constant: 10),
            tvPPrecio.heightAnchor.constraint(equalToConstant: viewBox.frame.size.height/2)
        ])
        
        NSLayoutConstraint.activate([
            btnBorrar.topAnchor.constraint(equalTo: tvPPrecio.bottomAnchor, constant: 10),
            btnBorrar.trailingAnchor.constraint(equalTo: viewBox.trailingAnchor, constant: -20),
            //btnBorrar.leadingAnchor.constraint(equalTo: tvPName.trailingAnchor,constant: 10),
            btnBorrar.heightAnchor.constraint(equalToConstant: 20),
            btnBorrar.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            hstack.topAnchor.constraint(equalTo: tvPName.bottomAnchor, constant: 10),
            hstack.leadingAnchor.constraint(equalTo: ivProducto.trailingAnchor,constant: 10),
            hstack.heightAnchor.constraint(equalToConstant: 20),
            hstack.widthAnchor.constraint(equalToConstant: 80),
            btnAdd.widthAnchor.constraint(equalToConstant: 20),
            btnMinus.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    @objc func addAction(sender: UIButton!){
        if(tvCantidad.text != ""){
            if let x = NumberFormatter().number(from: tvCantidad.text!){
                let res = x.intValue + 1
                tvCantidad.text = String(res)
            }
        }
    }
    
    @objc func minusAction(sender: UIButton!){
        if(tvCantidad.text != "" && tvCantidad.text != "0"){
            if let x = NumberFormatter().number(from: tvCantidad.text!){
                let res = x.intValue - 1
                tvCantidad.text = String(res)
            }
        }
    }
    
    /*override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }*/

}
