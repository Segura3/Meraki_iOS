//
//  OrdenVC.swift
//  Meraki
//
//  Created by Alberto Segura Sanchez on 12/05/22.
//

import UIKit

class OrdenVC: UIViewController {

    var btnContCompra: UIButton!
    var scroll: UIScrollView!
    var metPago: UILabel!
    var ivPago: UIImageView!
    var boxPago: OutlineBoxView!
    var dirEnvio: UILabel!
    var ivDireccion: UIImageView!
    var boxDir: OutlineBoxView!
    var vStackP: UIStackView!
    var vStackD: UIStackView!
    var hStackCvv: UIStackView!
    var hStackCalle: UIStackView!
    var hStackCalleE: UIStackView!
    
    //Campos de entrada, direccion de pago
    var noTrajeta: UITextField!
    var nombreTarjeta: UITextField!
    var vencimiento: UITextField!
    var cvv: UITextField!
    var calle: UITextField!
    var cNum: UITextField!
    var delegacion: UITextField!
    var estado: UITextField!
    var codigoPostal: UITextField!
    
    //Campos de entrada, direccion de envio
    var calleE: UITextField!
    var cNumE: UITextField!
    var delegacionE: UITextField!
    var estadoE: UITextField!
    var codigoPostalE: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        
        //Direccion de tarjeta
        
        ivPago = UIImageView(image: UIImage(named: "CardPago"))
        ivPago.translatesAutoresizingMaskIntoConstraints = false
        
        metPago = UILabel()
        metPago.text = "Método de pago"
        metPago.font = UIFont(name: "Domine-Medium", size: 20)
        metPago.translatesAutoresizingMaskIntoConstraints = false
        
        noTrajeta = UITextField()
        noTrajeta.placeholder = "Número de tarjeta"
        noTrajeta.borderStyle = .roundedRect
        noTrajeta.backgroundColor = UIColor(named: "Gray1")
        noTrajeta.font = UIFont(name: "Domine-Regular", size: 16)
        //noTrajeta.translatesAutoresizingMaskIntoConstraints = false
        
        nombreTarjeta = UITextField()
        nombreTarjeta.placeholder = "Nombre en la tarjeta"
        nombreTarjeta.borderStyle = .roundedRect
        nombreTarjeta.backgroundColor = UIColor(named: "Gray1")
        nombreTarjeta.font = UIFont(name: "Domine-Regular", size: 16)
        //nombreTarjeta.translatesAutoresizingMaskIntoConstraints = false
        
        vencimiento = UITextField()
        vencimiento.placeholder = "MM/YY"
        vencimiento.borderStyle = .roundedRect
        vencimiento.backgroundColor = UIColor(named: "Gray1")
        vencimiento.font = UIFont(name: "Domine-Regular", size: 16)
        vencimiento.translatesAutoresizingMaskIntoConstraints = false
        
        cvv = UITextField()
        cvv.placeholder = "CVV"
        cvv.borderStyle = .roundedRect
        cvv.backgroundColor = UIColor(named: "Gray1")
        cvv.font = UIFont(name: "Domine-Regular", size: 16)
        cvv.translatesAutoresizingMaskIntoConstraints = false
        
        hStackCvv = UIStackView()
        hStackCvv.axis = NSLayoutConstraint.Axis.horizontal
        //hStackCvv.distribution = .fillProportionally
        hStackCvv.spacing = 5.0
        hStackCvv.alignment = .leading
        hStackCvv.addArrangedSubview(vencimiento)
        hStackCvv.addArrangedSubview(cvv)
        
        calle = UITextField()
        calle.placeholder = "Calle"
        calle.borderStyle = .roundedRect
        calle.backgroundColor = UIColor(named: "Gray1")
        calle.font = UIFont(name: "Domine-Regular", size: 16)
        calle.translatesAutoresizingMaskIntoConstraints = false
        
        cNum = UITextField()
        cNum.placeholder = "No."
        cNum.borderStyle = .roundedRect
        cNum.backgroundColor = UIColor(named: "Gray1")
        cNum.font = UIFont(name: "Domine-Regular", size: 16)
        cNum.translatesAutoresizingMaskIntoConstraints = false
        
        hStackCalle = UIStackView()
        hStackCalle.axis = NSLayoutConstraint.Axis.horizontal
        hStackCalle.distribution = .fill
        hStackCalle.spacing = 5.0
        hStackCalle.alignment = .fill
        hStackCalle.addArrangedSubview(calle)
        hStackCalle.addArrangedSubview(cNum)
        
        delegacion = UITextField()
        delegacion.placeholder = "Delegación"
        delegacion.borderStyle = .roundedRect
        delegacion.backgroundColor = UIColor(named: "Gray1")
        delegacion.font = UIFont(name: "Domine-Regular", size: 16)
        delegacion.translatesAutoresizingMaskIntoConstraints = false
        
        estado = UITextField()
        estado.placeholder = "Estado"
        estado.borderStyle = .roundedRect
        estado.backgroundColor = UIColor(named: "Gray1")
        estado.font = UIFont(name: "Domine-Regular", size: 16)
        estado.translatesAutoresizingMaskIntoConstraints = false
        
        codigoPostal = UITextField()
        codigoPostal.placeholder = "Código Postal"
        codigoPostal.borderStyle = .roundedRect
        codigoPostal.backgroundColor = UIColor(named: "Gray1")
        codigoPostal.font = UIFont(name: "Domine-Regular", size: 16)
        codigoPostal.translatesAutoresizingMaskIntoConstraints = false
        
        vStackP = UIStackView()
        vStackP.axis = NSLayoutConstraint.Axis.vertical
        vStackP.distribution = .equalSpacing
        vStackP.alignment = .leading
        vStackP.spacing = 1.0
        vStackP.translatesAutoresizingMaskIntoConstraints = false
        vStackP.addArrangedSubview(noTrajeta)
        vStackP.addArrangedSubview(nombreTarjeta)
        vStackP.addArrangedSubview(hStackCvv)
        vStackP.addArrangedSubview(hStackCalle)
        vStackP.addArrangedSubview(delegacion)
        vStackP.addArrangedSubview(estado)
        vStackP.addArrangedSubview(codigoPostal)
        
        boxPago = OutlineBoxView()
        boxPago.translatesAutoresizingMaskIntoConstraints = false
        boxPago.addSubview(vStackP)
        
        // Direccion de envio
        
        ivDireccion = UIImageView(image: UIImage(named: "Location"))
        ivDireccion.translatesAutoresizingMaskIntoConstraints = false
    
        dirEnvio = UILabel()
        dirEnvio.text = "Dirección de envio"
        dirEnvio.font = UIFont(name: "Domine-Medium", size: 20)
        dirEnvio.translatesAutoresizingMaskIntoConstraints = false
        
        calleE = UITextField()
        calleE.placeholder = "Calle"
        calleE.borderStyle = .roundedRect
        calleE.backgroundColor = UIColor(named: "Gray1")
        calleE.font = UIFont(name: "Domine-Regular", size: 16)
        calleE.translatesAutoresizingMaskIntoConstraints = false
        
        cNumE = UITextField()
        cNumE.placeholder = "No."
        cNumE.borderStyle = .roundedRect
        cNumE.backgroundColor = UIColor(named: "Gray1")
        cNumE.font = UIFont(name: "Domine-Regular", size: 16)
        cNumE.translatesAutoresizingMaskIntoConstraints = false
        
        hStackCalleE = UIStackView()
        hStackCalleE.axis = NSLayoutConstraint.Axis.horizontal
        hStackCalleE.distribution = .fill
        hStackCalleE.spacing = 5.0
        hStackCalleE.alignment = .fill
        hStackCalleE.addArrangedSubview(calleE)
        hStackCalleE.addArrangedSubview(cNumE)
        
        delegacionE = UITextField()
        delegacionE.placeholder = "Delegación"
        delegacionE.borderStyle = .roundedRect
        delegacionE.backgroundColor = UIColor(named: "Gray1")
        delegacionE.font = UIFont(name: "Domine-Regular", size: 16)
        delegacionE.translatesAutoresizingMaskIntoConstraints = false
        
        estadoE = UITextField()
        estadoE.placeholder = "Estado"
        estadoE.borderStyle = .roundedRect
        estadoE.backgroundColor = UIColor(named: "Gray1")
        estadoE.font = UIFont(name: "Domine-Regular", size: 16)
        estadoE.translatesAutoresizingMaskIntoConstraints = false
        
        codigoPostalE = UITextField()
        codigoPostalE.placeholder = "Código Postal"
        codigoPostalE.borderStyle = .roundedRect
        codigoPostalE.backgroundColor = UIColor(named: "Gray1")
        codigoPostalE.font = UIFont(name: "Domine-Regular", size: 16)
        codigoPostalE.translatesAutoresizingMaskIntoConstraints = false
        
        vStackD = UIStackView()
        vStackD.axis = NSLayoutConstraint.Axis.vertical
        vStackD.distribution = .equalSpacing
        vStackD.alignment = .leading
        vStackD.spacing = 1.0
        vStackD.translatesAutoresizingMaskIntoConstraints = false
        vStackD.addArrangedSubview(hStackCalleE)
        vStackD.addArrangedSubview(delegacionE)
        vStackD.addArrangedSubview(estadoE)
        vStackD.addArrangedSubview(codigoPostalE)
        
        boxDir = OutlineBoxView()
        boxDir.translatesAutoresizingMaskIntoConstraints = false
        boxDir.addSubview(vStackD)
        
        scroll = UIScrollView()
        //scroll.backgroundColor = UIColor.lightGray
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.addSubview(ivPago)
        scroll.addSubview(metPago)
        scroll.addSubview(boxPago)
        scroll.addSubview(ivDireccion)
        scroll.addSubview(dirEnvio)
        scroll.addSubview(boxDir)
        
        btnContCompra = UIButton(type: .system)
        btnContCompra.setTitle("Continuar con la compra", for: .normal)
        btnContCompra.setTitleColor(UIColor.black, for: .normal)
        btnContCompra.titleLabel?.font = UIFont(name: "Domine-Regular", size: 16)
        btnContCompra.backgroundColor = UIColor(named: "Blue400")
        btnContCompra.layer.cornerRadius = 10.0
        btnContCompra.translatesAutoresizingMaskIntoConstraints = false
        btnContCompra.addTarget(self, action: #selector(goToFinalize), for: .touchUpInside)
        
        
        view.addSubview(btnContCompra)
        view.addSubview(scroll)
    }
    
    func setNavigationBar() {
        
        self.navigationItem.title = "Orden"

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
    
    override func viewWillLayoutSubviews() {
        
        NSLayoutConstraint.activate([
            scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scroll.bottomAnchor.constraint(equalTo: btnContCompra.topAnchor),
            scroll.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            ivPago.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 40),
            ivPago.topAnchor.constraint(equalTo: scroll.topAnchor, constant: 20),
            ivPago.widthAnchor.constraint(equalToConstant: 25),
            ivPago.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            metPago.leadingAnchor.constraint(equalTo: ivPago.trailingAnchor, constant: 10),
            metPago.topAnchor.constraint(equalTo: scroll.topAnchor, constant: 20),
            metPago.trailingAnchor.constraint(equalTo: scroll.trailingAnchor, constant: -20),
            metPago.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            boxPago.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 20),
            boxPago.topAnchor.constraint(equalTo: scroll.topAnchor, constant: 50),
            boxPago.trailingAnchor.constraint(equalTo: scroll.trailingAnchor, constant: -20),
            //boxPago.widthAnchor.constraint(equalToConstant: scroll.frame.size.width - 40),
            boxPago.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            vStackP.leadingAnchor.constraint(equalTo: boxPago.leadingAnchor, constant: 20),
            vStackP.topAnchor.constraint(equalTo: boxPago.topAnchor, constant: 10),
            vStackP.trailingAnchor.constraint(equalTo: boxPago.trailingAnchor, constant: -20),
            vStackP.bottomAnchor.constraint(equalTo: boxPago.bottomAnchor, constant: -10),
            hStackCalle.leadingAnchor.constraint(equalTo: vStackP.leadingAnchor),
            hStackCalle.trailingAnchor.constraint(equalTo: vStackP.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            noTrajeta.leadingAnchor.constraint(equalTo: vStackP.leadingAnchor),
            noTrajeta.trailingAnchor.constraint(equalTo: vStackP.trailingAnchor)
        ])
         
        NSLayoutConstraint.activate([
            nombreTarjeta.leadingAnchor.constraint(equalTo: vStackP.leadingAnchor),
            nombreTarjeta.trailingAnchor.constraint(equalTo: vStackP.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            delegacion.leadingAnchor.constraint(equalTo: vStackP.leadingAnchor),
            delegacion.trailingAnchor.constraint(equalTo: vStackP.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            estado.leadingAnchor.constraint(equalTo: vStackP.leadingAnchor),
            estado.trailingAnchor.constraint(equalTo: vStackP.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            vStackD.leadingAnchor.constraint(equalTo: boxDir.leadingAnchor, constant: 20),
            vStackD.topAnchor.constraint(equalTo: boxDir.topAnchor, constant: 10),
            vStackD.trailingAnchor.constraint(equalTo: boxDir.trailingAnchor, constant: -20),
            vStackD.bottomAnchor.constraint(equalTo: boxDir.bottomAnchor, constant: -10),
            hStackCalleE.leadingAnchor.constraint(equalTo: vStackD.leadingAnchor),
            hStackCalleE.trailingAnchor.constraint(equalTo: vStackD.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            delegacionE.leadingAnchor.constraint(equalTo: vStackD.leadingAnchor),
            delegacionE.trailingAnchor.constraint(equalTo: vStackD.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            estadoE.leadingAnchor.constraint(equalTo: vStackD.leadingAnchor),
            estadoE.trailingAnchor.constraint(equalTo: vStackD.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            ivDireccion.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 40),
            ivDireccion.topAnchor.constraint(equalTo: boxPago.bottomAnchor, constant: 20),
            ivDireccion.widthAnchor.constraint(equalToConstant: 25),
            ivDireccion.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            dirEnvio.leadingAnchor.constraint(equalTo: ivDireccion.trailingAnchor, constant: 10),
            dirEnvio.topAnchor.constraint(equalTo: boxPago.bottomAnchor, constant: 20),
            dirEnvio.trailingAnchor.constraint(equalTo: scroll.trailingAnchor, constant: -20),
            dirEnvio.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            boxDir.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 20),
            boxDir.topAnchor.constraint(equalTo: boxPago.bottomAnchor, constant: 50),
            boxDir.trailingAnchor.constraint(equalTo: scroll.trailingAnchor, constant: -20),
            //boxDir.widthAnchor.constraint(equalToConstant: scroll.frame.size.width - 40),
            boxDir.heightAnchor.constraint(equalToConstant: 180)
        ])
        
        NSLayoutConstraint.activate([
            btnContCompra.heightAnchor.constraint(equalToConstant: 40),
            btnContCompra.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            btnContCompra.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            btnContCompra.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
        ])
        
        scroll.contentLayoutGuide.widthAnchor.constraint(equalTo: scroll.frameLayoutGuide.widthAnchor, constant: 0).isActive = true
        scroll.contentLayoutGuide.heightAnchor.constraint(equalTo: scroll.frameLayoutGuide.heightAnchor, constant: 20).isActive = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @objc func goToFinalize(){
        self.performSegue(withIdentifier: "orderToFinalize", sender: nil)
    }
    
    @objc func backToMain() {
        self.navigationController?.popViewController(animated: true)
    }
}
