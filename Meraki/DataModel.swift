//
//  DataModel.swift
//  Meraki
//
//  Created by Alberto Segura Sanchez on 06/05/22.
//

import UIKit

struct CarritoItem {
    let nombre: String
    let precio: String
    let cantidad: String
    let foto: UIImage
}

struct PedidoItem {
    let noPedido: String
    let precio: String
    let cantidad: String
    let status: String
    let fecha: String
    let foto: UIImage
}

struct DestacadoItem {
    let nombre: String
    let precio: String
    let calificacion: String
    let foto: UIImage
}

struct CatalogItem {
    let nombre: String
    let precio: String
    let calificacion: String
    let foto: UIImage
}

struct SegueItem {
    var nombre: String
    var precio: String
    var calificacion: String
    var foto: UIImage
}

class DataSet {
    
    var carritoItems: [CarritoItem] = []
    var pedidoItems: [PedidoItem] = []
    var destadadoItems: [DestacadoItem] = []
    var catalogoItems: [CatalogItem] = []
    var segueItem: SegueItem!
    
    func getCarrito() {
        //Definicion de datos dummy
        let img1:UIImage = UIImage(named: "item1")!
        let img2:UIImage = UIImage(named: "item2")!
        let img3:UIImage = UIImage(named: "item3")!
        let img4:UIImage = UIImage(named: "item9")!
        
        let item1 = CarritoItem(nombre: "Playera Raglan", precio: "100.00", cantidad: "1", foto: img1)
        let item2 = CarritoItem(nombre: "Taza navideña", precio: "150.00", cantidad: "2", foto: img2)
        let item3 = CarritoItem(nombre: "Pañalero 3 años", precio: "180.00", cantidad: "3", foto: img3)
        let item4 = CarritoItem(nombre: "Cojines pareja", precio: "280.00", cantidad: "1", foto: img4)
        carritoItems.append(item1)
        carritoItems.append(item2)
        carritoItems.append(item3)
        carritoItems.append(item4)
    }
    
    func getPedidos() {
        //Definicion de datos dummy
        let img1:UIImage = UIImage(named: "item1")!
        let img5:UIImage = UIImage(named: "item10")!
        let img3:UIImage = UIImage(named: "item8")!
        let img4:UIImage = UIImage(named: "item4")!
        
        let it1 = PedidoItem(noPedido: "036252", precio: "750.00", cantidad: "3", status: "Entregado", fecha: "15 de Marzo de 2022", foto: img1)
        let it2 = PedidoItem(noPedido: "036269", precio: "150.00", cantidad: "1", status: "Enviado", fecha: "26 de Octubre de 2021", foto: img5)
        let it3 = PedidoItem(noPedido: "036561", precio: "800.00", cantidad: "2", status: "Cancelado", fecha: "10 de Agosto de 2019", foto: img3)
        let it4 = PedidoItem(noPedido: "037291", precio: "400.00", cantidad: "4", status: "Procesado", fecha: "20 de Junio de 2022", foto: img4)
        pedidoItems.append(it1)
        pedidoItems.append(it2)
        pedidoItems.append(it3)
        pedidoItems.append(it4)
    }
    
    func getDestacados() {
        //Definicion de datos dummy
        let img1:UIImage = UIImage(named: "item1")!
        let img2:UIImage = UIImage(named: "item2")!
        let img3:UIImage = UIImage(named: "item3")!
        let img4:UIImage = UIImage(named: "item4")!
        let img5:UIImage = UIImage(named: "item5")!
        
        let item1 = DestacadoItem(nombre: "Playera Raglan", precio: "100.00", calificacion: "4.5", foto: img1)
        let item2 = DestacadoItem(nombre: "Taza navideña", precio: "150.00", calificacion: "5.0", foto: img2)
        let item3 = DestacadoItem(nombre: "Pañalero 3 años", precio: "180.00", calificacion: "4.0", foto: img3)
        let item4 = DestacadoItem(nombre: "Playera corte Recto", precio: "180.00", calificacion: "4.2", foto: img4)
        let item5 = DestacadoItem(nombre: "Cojines pareja", precio: "260.00", calificacion: "4.0", foto: img5)
        destadadoItems.append(item1)
        destadadoItems.append(item2)
        destadadoItems.append(item3)
        destadadoItems.append(item4)
        destadadoItems.append(item5)
    }
    
    func getGeneralCat() {
        //Definicion de datos dummy
        let img1:UIImage = UIImage(named: "item6")!
        let img2:UIImage = UIImage(named: "item7")!
        let img3:UIImage = UIImage(named: "item8")!
        let img4:UIImage = UIImage(named: "item9")!
        let img5:UIImage = UIImage(named: "item10")!
        let img6:UIImage = UIImage(named: "item3")!
        
        let item1 = CatalogItem(nombre: "Playera Star Wars", precio: "100.00", calificacion: "4.5", foto: img1)
        let item2 = CatalogItem(nombre: "Playera dama Baby Shark", precio: "150.00", calificacion: "5.0", foto: img2)
        let item3 = CatalogItem(nombre: "Playeras tóxicas", precio: "180.00", calificacion: "4.0", foto: img3)
        let item4 = CatalogItem(nombre: "Cojines pareja", precio: "180.00", calificacion: "4.2", foto: img4)
        let item5 = CatalogItem(nombre: "Blusa Tía", precio: "160.00", calificacion: "4.0", foto: img5)
        let item6 = CatalogItem(nombre: "Pañalero 3 años", precio: "180.00", calificacion: "4.0", foto: img6)
        catalogoItems.append(item1)
        catalogoItems.append(item2)
        catalogoItems.append(item3)
        catalogoItems.append(item4)
        catalogoItems.append(item5)
        catalogoItems.append(item6)
    }
    
    func getEmptyItem() {
        segueItem = SegueItem(nombre: "", precio: "", calificacion: "", foto: UIImage())
    }
}
