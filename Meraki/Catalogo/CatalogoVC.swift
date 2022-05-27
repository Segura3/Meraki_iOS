//
//  CatalogoVC.swift
//  Meraki
//
//  Created by Alberto Segura Sanchez on 20/05/22.
//

import UIKit

class CatalogoVC: UIViewController {
      
    var tvCatalog: UITableView!
    
    //Objects for segue
    var datos = DataSet()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.tabBarController?.tabBar.layer.zPosition = 0
        
        datos.getEmptyItem()

        self.navigationItem.title = "Catálogo"
        self.navigationController?.navigationBar.backgroundColor = UIColor(named: "Blue4")
        
        tvCatalog = UITableView()
        tvCatalog.register(DestacadosTVCell.self, forCellReuseIdentifier: DestacadosTVCell.identifier)
        tvCatalog.register(CGeneralTVCell.self, forCellReuseIdentifier: CGeneralTVCell.identifier)
        tvCatalog.allowsSelection = false
        tvCatalog.dataSource = self
        tvCatalog.delegate = self
        tvCatalog.separatorStyle = .none
        tvCatalog.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tvCatalog)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        NSLayoutConstraint.activate([
            tvCatalog.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tvCatalog.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tvCatalog.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            tvCatalog.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ])
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let vc = segue.destination as! DetalleVC
        if datos.segueItem != nil {
            vc.receivedCatalogItem = datos.segueItem
        }
        //vc.hidesBottomBarWhenPushed = true
        //self.hidesBottomBarWhenPushed = true
    }
    

}

extension CatalogoVC: UITableViewDataSource, UITableViewDelegate, CGeneralCVCellDelegate, DestacCVCellDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Cell for Destacados
        if indexPath.row == 0 {
            var cell = tableView.dequeueReusableCell(withIdentifier: DestacadosTVCell.identifier, for: indexPath) as? DestacadosTVCell
            cell?.cellDelegate = self
            return cell!
        } else if indexPath.row == 2 {
            var cell = tableView.dequeueReusableCell(withIdentifier: CGeneralTVCell.identifier, for: indexPath) as? CGeneralTVCell
            cell?.cellDelegate = self
            return cell!
        } else {
            //faltan los chips para los filtros
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 230
        } else if indexPath.row == 2 {
            return 400 * 2.4
        } else {
            return 30
        }
    }
    
    func collectionView(collectionviewcell: CGeneralCVCell?, index: Int, didTappedInTableViewCell: CGeneralTVCell) {
        if let item = didTappedInTableViewCell.datos.catalogoItems[index] as? CatalogItem{
            print("You tapped the cell \(index) in the row of colors \(item.nombre)")
            // You can also do changes to the cell you tapped using the 'collectionviewcell'
            datos.segueItem.nombre = item.nombre
            datos.segueItem.precio = item.precio
            datos.segueItem.calificacion = item.calificacion
            datos.segueItem.foto = item.foto
            self.performSegue(withIdentifier: "catalogToDetalle", sender: nil)
        }
    }
    func collectionView(collectionviewcell: DestacCVCell?, index: Int, didTappedInTableViewCell: DestacadosTVCell) {
        if let item = didTappedInTableViewCell.datos.destadadoItems[index] as? DestacadoItem{
            print("You tapped the cell \(index) in the row of colors \(item.nombre)")
            // You can also do changes to the cell you tapped using the 'collectionviewcell'
            datos.segueItem.nombre = item.nombre
            datos.segueItem.precio = item.precio
            datos.segueItem.calificacion = item.calificacion
            datos.segueItem.foto = item.foto
            self.performSegue(withIdentifier: "catalogToDetalle", sender: nil)
        }
    }
}
