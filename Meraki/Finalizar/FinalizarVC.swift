//
//  FinalizarVC.swift
//  Meraki
//
//  Created by Alberto Segura Sanchez on 15/05/22.
//

import UIKit

class FinalizarVC: UIViewController {
    
    var btnFinalizar: UIButton!
    var tvCarrito: UITableView!
    
    let datos = DataSet()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnFinalizar = UIButton(type: .system)
        btnFinalizar.setTitle("Finalizar compra", for: .normal)
        btnFinalizar.titleLabel?.font = UIFont(name: "Domine-Regular", size: 16)
        btnFinalizar.setTitleColor(UIColor.black, for: .normal)
        btnFinalizar.backgroundColor = UIColor(named: "Blue400")
        btnFinalizar.layer.cornerRadius = 10.0
        btnFinalizar.translatesAutoresizingMaskIntoConstraints = false
        btnFinalizar.addTarget(self, action: #selector(finalizar), for: .touchUpInside)
        
        self.tvCarrito = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - (btnFinalizar.frame.height + 50)), style: .grouped)
        tvCarrito.register(FinalizarTVCell.self, forCellReuseIdentifier: FinalizarTVCell.identifier)
        tvCarrito.register(TableHeader.self, forHeaderFooterViewReuseIdentifier: TableHeader.identifier)
        tvCarrito.register(TableFooter.self, forHeaderFooterViewReuseIdentifier: TableFooter.identifier)
        tvCarrito.separatorStyle = .none
        tvCarrito.allowsSelection = false
        
        tvCarrito.dataSource = self
        tvCarrito.delegate = self
        //tvCarrito.translatesAutoresizingMaskIntoConstraints = false
        
        datos.getCarrito()
        
        setNavigationBar()
               
        view.addSubview(tvCarrito)
        view.addSubview(btnFinalizar)
        
        view.backgroundColor = .white
    }
    
    override func viewWillLayoutSubviews() {
        super .viewWillLayoutSubviews()
        
        NSLayoutConstraint.activate([
            btnFinalizar.heightAnchor.constraint(equalToConstant: 40),
            btnFinalizar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            btnFinalizar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            btnFinalizar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
        ])
    }
    
    @objc func finalizar() {
        let alert = UIAlertController(title: "", message: "Compra completada", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func setNavigationBar() {
        
        self.navigationItem.title = "Confirmación de compra"

        self.navigationItem.setHidesBackButton(true, animated:false)

        let view = UIView(frame: CGRect(x: 0, y: 10, width: 20, height: 20))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))

        if let imgBackArrow = UIImage(named: "Back") {
            imageView.image = imgBackArrow
        }
        view.addSubview(imageView)

        let backTap = UITapGestureRecognizer(target: self, action: #selector(backToMain))
        view.addGestureRecognizer(backTap)

        let leftBarButtonItem = UIBarButtonItem(customView: view)
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc func backToMain() {
        self.navigationController?.popViewController(animated: true)
    }

}

extension FinalizarVC: UITableViewDataSource, UITableViewDelegate {
    //Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableHeader.identifier) as? TableHeader
        header?.tintColor = .clear
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 220
    }
    
    //Cell
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datos.carritoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FinalizarTVCell.identifier, for: indexPath) as? FinalizarTVCell
        cell?.ivProducto.image = datos.carritoItems[indexPath.row].foto
        cell?.tvPName.text = datos.carritoItems[indexPath.row].nombre
        cell?.tvPPrecio.text = "$ "+datos.carritoItems[indexPath.row].precio
        cell?.tvCantidad.text = "Cantidad: "+datos.carritoItems[indexPath.row].cantidad
        
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    // Footer
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableFooter.identifier) as? TableFooter
        //Aqui se pueden actualizar los valores de las sumas totales
        //footer?.totalQty.text = "$1000.00"
        footer?.backgroundColor = .clear
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 120
    }
}
