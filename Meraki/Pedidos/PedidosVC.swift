//
//  PedidosVC.swift
//  Meraki
//
//  Created by Alberto Segura Sanchez on 18/05/22.
//

import UIKit

class PedidosVC: UIViewController {
    
    var tvPedidos: UITableView!
    var txtTitle: UILabel!
    var headerBox: BoxView!
    
    let datos = DataSet()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        datos.getPedidos()
        
        txtTitle = UILabel()
        txtTitle.text = "Pedidos"
        txtTitle.font = UIFont(name: "Domine-Medium", size: 20)
        txtTitle.textAlignment = .center
        //txtTitle.backgroundColor = .yellow
        txtTitle.translatesAutoresizingMaskIntoConstraints = false
        
        headerBox = BoxView()
        headerBox.addSubview(txtTitle)
        headerBox.translatesAutoresizingMaskIntoConstraints = false
        
        tvPedidos = UITableView()
        tvPedidos.register(PedidosTVCell.self, forCellReuseIdentifier: PedidosTVCell.identifier)
        tvPedidos.allowsSelection = false
        tvPedidos.dataSource = self
        tvPedidos.delegate = self
        tvPedidos.separatorStyle = .none
        //tvPedidos.backgroundColor = .yellow
        tvPedidos.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(headerBox)
        view.addSubview(tvPedidos)
    }
    
    override func viewWillLayoutSubviews() {
        super .viewWillLayoutSubviews()
        
        NSLayoutConstraint.activate([
            headerBox.heightAnchor.constraint(equalToConstant: 40),
            headerBox.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            headerBox.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            headerBox.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            txtTitle.centerXAnchor.constraint(equalTo: headerBox.centerXAnchor),
            txtTitle.centerYAnchor.constraint(equalTo: headerBox.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            tvPedidos.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tvPedidos.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tvPedidos.topAnchor.constraint(equalTo: headerBox.bottomAnchor, constant: 10),
            tvPedidos.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PedidosVC: UITableViewDataSource, UITableViewDelegate {
    //Cell
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datos.pedidoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PedidosTVCell.identifier, for: indexPath) as? PedidosTVCell
        cell?.ivProducto.image = datos.pedidoItems[indexPath.row].foto
        cell?.tvNoPedido.text = "Pedido #" + datos.pedidoItems[indexPath.row].noPedido
        cell?.tvPrecio.text = "$ " + datos.pedidoItems[indexPath.row].precio
        cell?.tvCantidad.text = "Número de artículos: " + datos.pedidoItems[indexPath.row].cantidad
        cell?.tvFecha.text = datos.pedidoItems[indexPath.row].fecha
        if datos.pedidoItems[indexPath.row].status == "Cancelado"{
            cell?.tvStatus.layer.backgroundColor = UIColor(named: "Red")?.cgColor
        }
        cell?.tvStatus.text = datos.pedidoItems[indexPath.row].status
        
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}
