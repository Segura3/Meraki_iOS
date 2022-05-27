//
//  FinalizarTVCell.swift
//  Meraki
//
//  Created by Alberto Segura Sanchez on 18/05/22.
//

import UIKit

class FinalizarTVCell: UITableViewCell {
    
    static let identifier = "FinalizarTVCell"
    
    var viewBox: OutlineBoxView!
    var ivProducto: UIImageView!
    var tvPName: UILabel!
    var tvPPrecio: UILabel!
    var tvCantidad: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        viewBox = OutlineBoxView()
        
        ivProducto = UIImageView()
        ivProducto.frame.size.width = 80
        ivProducto.frame.size.height = 80
        ivProducto.contentMode = .scaleAspectFit
        ivProducto.translatesAutoresizingMaskIntoConstraints = false
        
        tvPName = UILabel()
        tvPName.font = UIFont(name: "Domine-Regular", size: 16)
        tvPName.textAlignment = .left
        tvPName.translatesAutoresizingMaskIntoConstraints = false
        
        tvPPrecio = UILabel()
        tvPPrecio.font = UIFont(name: "OpenSans-Medium", size: 16)
        tvPPrecio.textAlignment = .right
        tvPPrecio.translatesAutoresizingMaskIntoConstraints = false
        
        tvCantidad = UILabel()
        tvCantidad.textAlignment = .center
        tvCantidad.font = UIFont(name: "Domine-Regular", size: 12)
        tvCantidad.translatesAutoresizingMaskIntoConstraints = false
        
        viewBox.addSubview(ivProducto)
        viewBox.addSubview(tvPPrecio)
        viewBox.addSubview(tvPName)
        viewBox.addSubview(tvCantidad)
        contentView.addSubview(viewBox)
        contentView.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        viewBox.frame = CGRect(x: 20, y: 5, width: contentView.frame.width-40, height: 80)
        
        NSLayoutConstraint.activate([
            ivProducto.topAnchor.constraint(equalTo: viewBox.topAnchor, constant: 10),
            ivProducto.leadingAnchor.constraint(equalTo: viewBox.leadingAnchor, constant: 10),
            ivProducto.widthAnchor.constraint(equalToConstant: 80),
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
            tvCantidad.topAnchor.constraint(equalTo: tvPName.bottomAnchor, constant: 5),
            tvCantidad.leadingAnchor.constraint(equalTo: ivProducto.trailingAnchor,constant: 10),
            tvCantidad.heightAnchor.constraint(equalToConstant: 20),
            tvCantidad.widthAnchor.constraint(equalToConstant: 80)
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
