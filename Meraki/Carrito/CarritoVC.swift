//
//  CarritoVC.swift
//  Meraki
//
//  Created by Alberto Segura Sanchez on 05/05/22.
//

import UIKit

class CarritoVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    //@IBOutlet weak var headerBox: BoxView!
    var hBox: BoxView!
    
    var btnComprar: UIButton!
    
    private let tvCarrito: UITableView = {
        let tableView = UITableView()
        tableView.register(CarritoTVCell.self, forCellReuseIdentifier: CarritoTVCell.identifier)
        tableView.register(TableFooter.self, forHeaderFooterViewReuseIdentifier: TableFooter.identifier)
        tableView.allowsSelection = false
        return tableView
    }()
    
    let datos = DataSet()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tvCarrito.dataSource = self
        tvCarrito.delegate = self
        tvCarrito.separatorStyle = .none
        tvCarrito.translatesAutoresizingMaskIntoConstraints = false
        
        datos.getCarrito()
        
        hBox = BoxView()
        
        //self.navigationController?.navigationBar.barTintColor = .blue
        self.navigationItem.title = "Carrito"
        self.navigationController?.navigationBar.backgroundColor = UIColor(named: "Blue4")
        //self.navigationItem.titleView?.addSubview(hBox)
        
        btnComprar = UIButton(type: .system)
        btnComprar.setTitle("Comprar", for: .normal)
        btnComprar.titleLabel?.font = UIFont(name: "Domine-Regular", size: 16)
        btnComprar.setTitleColor(UIColor.black, for: .normal)
        btnComprar.backgroundColor = UIColor(named: "Blue400")
        btnComprar.layer.cornerRadius = 10.0
        btnComprar.translatesAutoresizingMaskIntoConstraints = false
        btnComprar.addTarget(self, action: #selector(goToOrden), for: .touchUpInside)
        
        view.addSubview(tvCarrito)
        view.addSubview(btnComprar)
    }
    
    override func viewDidLayoutSubviews() {
        super .viewDidLayoutSubviews()
    }
    
    override func viewWillLayoutSubviews() {
        
        NSLayoutConstraint.activate([
            tvCarrito.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            tvCarrito.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tvCarrito.widthAnchor.constraint(equalTo: view.widthAnchor),
            tvCarrito.bottomAnchor.constraint(equalTo: btnComprar.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            //btnComprar.topAnchor.constraint(equalTo: tvCarrito.bottomAnchor, constant: 10),
            btnComprar.heightAnchor.constraint(equalToConstant: 40),
            btnComprar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            btnComprar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            btnComprar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
    }
    
    //Cells
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datos.carritoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CarritoTVCell.identifier, for: indexPath) as? CarritoTVCell
        cell?.ivProducto.image = datos.carritoItems[indexPath.row].foto
        cell?.tvPName.text = datos.carritoItems[indexPath.row].nombre
        cell?.tvPPrecio.text = "$ "+datos.carritoItems[indexPath.row].precio
        cell?.tvCantidad.text = datos.carritoItems[indexPath.row].cantidad
        
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    // Footer
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableFooter.identifier) as? TableFooter
        //Aqui se pueden actualizar los valores de las sumas totales
        //footer?.totalQty.text = "$1000.00"
        
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 130
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let vc = segue.destination as? OrdenVC
        vc?.hidesBottomBarWhenPushed = true
    }
    
    @objc func goToOrden(){
        self.performSegue(withIdentifier: "carritoToOrder", sender: nil)
    }
}
