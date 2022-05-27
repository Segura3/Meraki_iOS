//
//  PedidosTVCell.swift
//  Meraki
//
//  Created by Alberto Segura Sanchez on 18/05/22.
//

import UIKit

class PedidosTVCell: UITableViewCell {
    
    static let identifier = "PedidosTVCell"
    
    var viewBox: OutlineSQBoxView!
    var ivProducto: UIImageView!
    var tvNoPedido: UILabel!
    var tvPrecio: UILabel!
    var tvFecha: UILabel!
    var tvCantidad: UILabel!
    var tvStatus: UILabel!
    var hstack: UIStackView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        viewBox = OutlineSQBoxView()
        
        ivProducto = UIImageView()
        ivProducto.frame.size.width = 80
        ivProducto.frame.size.height = 80
        ivProducto.contentMode = .scaleAspectFit
        ivProducto.translatesAutoresizingMaskIntoConstraints = false
        
        tvNoPedido = UILabel()
        tvNoPedido.font = UIFont(name: "OpenSans-Medium", size: 16)
        tvNoPedido.textAlignment = .left
        //tvNoPedido.translatesAutoresizingMaskIntoConstraints = false
        
        tvCantidad = UILabel()
        tvCantidad.font = UIFont(name: "OpenSans-Medium", size: 10)
        tvCantidad.textAlignment = .left
        //tvCantidad.translatesAutoresizingMaskIntoConstraints = false
        
        tvFecha = UILabel()
        tvFecha.font = UIFont(name: "OpenSans-Medium", size: 12)
        tvFecha.textAlignment = .left
        tvFecha.textColor = UIColor(named: "Blue700")
        //tvFecha.translatesAutoresizingMaskIntoConstraints = false
        
        hstack = UIStackView()
        hstack.axis = NSLayoutConstraint.Axis.vertical
        hstack.distribution = .fillProportionally
        hstack.alignment = .leading
        hstack.spacing = 1.0
        hstack.addArrangedSubview(tvNoPedido)
        hstack.addArrangedSubview(tvCantidad)
        hstack.addArrangedSubview(tvFecha)
        hstack.translatesAutoresizingMaskIntoConstraints = false
        
        tvStatus = UILabel()
        tvStatus.font = .systemFont(ofSize: 12, weight: .semibold)
        tvStatus.textAlignment = .center
        tvStatus.font = UIFont(name: "OpenSans-Medium", size: 12)
        //tvStatus.backgroundColor = UIColor(named: "Green")
        tvStatus.layer.cornerRadius = 10
        tvStatus.layer.backgroundColor = UIColor(named: "Green")?.cgColor
        tvStatus.translatesAutoresizingMaskIntoConstraints = false
        
        tvPrecio = UILabel()
        tvPrecio.font = UIFont(name: "Domine-Medium", size: 14)
        tvPrecio.textAlignment = .center
        tvPrecio.translatesAutoresizingMaskIntoConstraints = false
        
        viewBox.addSubview(ivProducto)
        viewBox.addSubview(tvPrecio)
        viewBox.addSubview(tvStatus)
        viewBox.addSubview(hstack)
        contentView.addSubview(viewBox)
        contentView.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        viewBox.frame = CGRect(x: 10, y: 5, width: contentView.frame.width-20, height: 100)
        
        NSLayoutConstraint.activate([
            ivProducto.topAnchor.constraint(equalTo: viewBox.topAnchor, constant: 10),
            ivProducto.leadingAnchor.constraint(equalTo: viewBox.leadingAnchor, constant: 10),
            ivProducto.widthAnchor.constraint(equalToConstant: 80),
            ivProducto.bottomAnchor.constraint(equalTo: viewBox.bottomAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            tvStatus.topAnchor.constraint(equalTo: viewBox.topAnchor, constant: 10),
            tvStatus.trailingAnchor.constraint(equalTo: viewBox.trailingAnchor, constant: -10),
            tvStatus.widthAnchor.constraint(equalToConstant: 70),
            tvStatus.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            tvPrecio.bottomAnchor.constraint(equalTo: viewBox.bottomAnchor, constant: -30),
            tvPrecio.trailingAnchor.constraint(equalTo: viewBox.trailingAnchor, constant: -10),
            tvPrecio.widthAnchor.constraint(equalToConstant: 70),
            tvPrecio.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            hstack.topAnchor.constraint(equalTo: viewBox.topAnchor, constant: 10),
            hstack.leadingAnchor.constraint(equalTo: ivProducto.trailingAnchor,constant: 10),
            hstack.trailingAnchor.constraint(equalTo: tvStatus.leadingAnchor, constant: 5),
            hstack.bottomAnchor.constraint(equalTo: viewBox.bottomAnchor, constant: -10)
        ])
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
