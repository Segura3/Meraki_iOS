//
//  DestacadosTVCell.swift
//  Meraki
//
//  Created by Alberto Segura Sanchez on 21/05/22.
//

import UIKit

protocol DestacCVCellDelegate: AnyObject {
    func collectionView(collectionviewcell: DestacCVCell?, index: Int, didTappedInTableViewCell: DestacadosTVCell)
}

class DestacadosTVCell: UITableViewCell {
    
    weak var cellDelegate: DestacCVCellDelegate?
    
    static let identifier = "DestacadosTVCell"
    
    let datos = DataSet() 
    
    var labelDestacados: UILabel!
    var collecDestacados: UICollectionView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        //Datos para la seccion de destacados
        datos.getDestacados()
        
        labelDestacados = UILabel()
        labelDestacados.text = "Productos destacados"
        //labelDestacados.font = .systemFont(ofSize: 15, weight: .semibold)
        labelDestacados.font = UIFont(name: "OpenSans-Medium", size: 20)
        labelDestacados.textAlignment = .left
        //labelDestacados.backgroundColor = .yellow
        labelDestacados.translatesAutoresizingMaskIntoConstraints = false
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 2, left: 8, bottom: 2, right: 2)
        collecDestacados = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //collecDestacados.backgroundColor = .yellow
        let nib = UINib(nibName: "DestacCVCell",bundle: nil)
        collecDestacados.register(nib, forCellWithReuseIdentifier: "DestacCVCell")
        collecDestacados.delegate = self
        collecDestacados.dataSource = self
        collecDestacados.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(labelDestacados)
        contentView.addSubview(collecDestacados)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            labelDestacados.heightAnchor.constraint(equalToConstant: 20),
            labelDestacados.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            labelDestacados.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            labelDestacados.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            collecDestacados.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collecDestacados.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collecDestacados.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collecDestacados.topAnchor.constraint(equalTo: labelDestacados.bottomAnchor)
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

extension DestacadosTVCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datos.destadadoItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DestacCVCell.identifier, for: indexPath) as? DestacCVCell
        cell?.imgProd.image = datos.destadadoItems[indexPath.row].foto
        cell?.nameProd.text = datos.destadadoItems[indexPath.row].nombre
        cell?.precio.text = "$ "+datos.destadadoItems[indexPath.row].precio
        cell?.calificacion.text = datos.destadadoItems[indexPath.row].calificacion
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //let width: CGFloat = contentView.frame.size.width/2.6
        //return CGSize(width: width, height: width/0.7)
        return CGSize(width: 130, height: 175)
        //return CGSize(width: 260, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? DestacCVCell
        self.cellDelegate?.collectionView(collectionviewcell: cell, index: indexPath.item, didTappedInTableViewCell: self)
    }
}
