//
//  CGeneralTVCell.swift
//  Meraki
//
//  Created by Alberto Segura Sanchez on 22/05/22.
//

import UIKit

protocol CGeneralCVCellDelegate: AnyObject {
    func collectionView(collectionviewcell: CGeneralCVCell?, index: Int, didTappedInTableViewCell: CGeneralTVCell)
}

class CGeneralTVCell: UITableViewCell {
    
    weak var cellDelegate: CGeneralCVCellDelegate?
    
    static let identifier = "CGeneralTVCell"
    
    let datos = DataSet()
    
    var collecGeneral: UICollectionView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        datos.getGeneralCat()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        collecGeneral = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //collecGeneral.backgroundColor = .yellow
        let nib = UINib(nibName: "CGeneralCVCell",bundle: nil)
        collecGeneral.register(nib, forCellWithReuseIdentifier: "CGeneralCVCell")
        collecGeneral.delegate = self
        collecGeneral.dataSource = self
        collecGeneral.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(collecGeneral)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            collecGeneral.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collecGeneral.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            collecGeneral.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            collecGeneral.topAnchor.constraint(equalTo: contentView.topAnchor)
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

extension CGeneralTVCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datos.catalogoItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CGeneralCVCell.identifier, for: indexPath) as? CGeneralCVCell
        cell?.imgProd.image = datos.catalogoItems[indexPath.row].foto
        cell?.nameProd.text = datos.catalogoItems[indexPath.row].nombre
        cell?.precio.text = "$ "+datos.catalogoItems[indexPath.row].precio
        //cell?.calificacion.text = datos.catalogoItems[indexPath.row].calificacion
        cell?.layer.cornerRadius = 8
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? CGeneralCVCell
        self.cellDelegate?.collectionView(collectionviewcell: cell, index: indexPath.item, didTappedInTableViewCell: self)
    }
}
