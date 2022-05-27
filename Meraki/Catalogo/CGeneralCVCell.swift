//
//  CGeneralCVCell.swift
//  Meraki
//
//  Created by Alberto Segura Sanchez on 22/05/22.
//

import UIKit

class CGeneralCVCell: UICollectionViewCell {
    
    static let identifier = "CGeneralCVCell"

    @IBOutlet weak var shadowBox: ShadowBoxView!
    
    @IBOutlet weak var imgProd: UIImageView!
    @IBOutlet weak var nameProd: UILabel!
    @IBOutlet weak var precio: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
}
