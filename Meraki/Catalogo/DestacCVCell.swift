//
//  DestacCVCell.swift
//  Meraki
//
//  Created by Alberto Segura Sanchez on 22/05/22.
//

import UIKit

class DestacCVCell: UICollectionViewCell {
    
    static let identifier = "DestacCVCell"

    @IBOutlet weak var imgProd: UIImageView!
    @IBOutlet weak var nameProd: UILabel!
    @IBOutlet weak var calificacion: UILabel!
    @IBOutlet weak var precio: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
