//
//  InicioVC.swift
//  Meraki
//
//  Created by Alberto Segura Sanchez on 04/05/22.
//

import UIKit

class InicioVC: UIViewController {
    
    @IBOutlet weak var headerv: HeaderView!
    @IBOutlet weak var holaLabel: UILabel!
    @IBOutlet weak var btnProfile: UIButton!
    
    var btnCatalogo: UIButton!
    var btnCreacion: UIButton!
    var btnPedidos: UIButton!
    var btnPromociones: UIButton!
    var btnPreguntas: UIButton!
    var btnContacto: UIButton!
    var hstack: UIStackView!
    var scroll: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        scroll = UIScrollView()
        
        btnCatalogo = UIButton(type: .system)
        btnCatalogo.setBackgroundImage(UIImage(named: "catalogo"), for: .normal)
        btnCatalogo.addTarget(self, action: #selector(loadCatalogo), for: .touchUpInside)
        scroll.addSubview(btnCatalogo)
        
        btnCreacion = UIButton(type: .system)
        btnCreacion.setBackgroundImage(UIImage(named: "pdiseno"), for: .normal)
        btnCreacion.addTarget(self, action: #selector(loadCreacion), for: .touchUpInside)
        scroll.addSubview(btnCreacion)
        
        hstack = UIStackView()
        hstack.axis = NSLayoutConstraint.Axis.horizontal
        hstack.distribution = .equalSpacing
        hstack.alignment = .center
        hstack.spacing = 1.0
        
        btnPedidos = UIButton(type: .system)
        btnPedidos.setBackgroundImage(UIImage(named: "pedidos"), for: .normal)
        btnPedidos.addTarget(self, action: #selector(loadPedidos), for: .touchUpInside)
        hstack.addArrangedSubview(btnPedidos)
        
        btnPromociones = UIButton(type: .system)
        btnPromociones.setBackgroundImage(UIImage(named: "promociones"), for: .normal)
        btnPromociones.addTarget(self, action: #selector(loadPromociones), for: .touchUpInside)
        hstack.addArrangedSubview(btnPromociones)
        
        scroll.addSubview(hstack)
        
        btnPreguntas = UIButton(type: .system)
        btnPreguntas.setTitle("Preguntas frecuentes", for: .normal)
        btnPreguntas.titleLabel?.font = UIFont(name: "Domine-Regular", size: 16)
        btnPreguntas.setTitleColor(UIColor.black, for: .normal)
        btnPreguntas.backgroundColor = UIColor(named: "Blue4")
        btnPreguntas.layer.cornerRadius = 10.0
        btnPreguntas.addTarget(self, action: #selector(preguntasFrecuentes), for: .touchUpInside)
        scroll.addSubview(btnPreguntas)
        
        btnContacto = UIButton(type: .system)
        btnContacto.setTitle("Contáctanos", for: .normal)
        btnContacto.titleLabel?.font = UIFont(name: "Domine-Regular", size: 16)
        btnContacto.setTitleColor(UIColor.black, for: .normal)
        btnContacto.backgroundColor = UIColor(named: "Blue4")
        btnContacto.layer.cornerRadius = 10.0
        btnContacto.addTarget(self, action: #selector(contacto), for: .touchUpInside)
        scroll.addSubview(btnContacto)
        
        self.view.addSubview(scroll)
        
        scroll.translatesAutoresizingMaskIntoConstraints = false
        btnCatalogo.translatesAutoresizingMaskIntoConstraints = false
        btnCreacion.translatesAutoresizingMaskIntoConstraints = false
        hstack.translatesAutoresizingMaskIntoConstraints = false
        btnPreguntas.translatesAutoresizingMaskIntoConstraints = false
        btnContacto.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func viewWillLayoutSubviews() {
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: headerv.bottomAnchor),
            scroll.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scroll.widthAnchor.constraint(equalTo: view.widthAnchor),
            scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            btnCatalogo.topAnchor.constraint(equalTo: scroll.topAnchor, constant: 20),
            btnCatalogo.leadingAnchor.constraint(equalTo: scroll.frameLayoutGuide.leadingAnchor, constant: 20),
            btnCatalogo.trailingAnchor.constraint(equalTo: scroll.frameLayoutGuide.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            btnCreacion.topAnchor.constraint(equalTo: btnCatalogo.bottomAnchor, constant: 20),
            btnCreacion.leadingAnchor.constraint(equalTo: scroll.frameLayoutGuide.leadingAnchor, constant: 20),
            btnCreacion.trailingAnchor.constraint(equalTo: scroll.frameLayoutGuide.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            hstack.topAnchor.constraint(equalTo: btnCreacion.bottomAnchor, constant: 20),
            hstack.leadingAnchor.constraint(equalTo: scroll.frameLayoutGuide.leadingAnchor, constant: 20),
            hstack.trailingAnchor.constraint(equalTo: scroll.frameLayoutGuide.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            btnPreguntas.topAnchor.constraint(equalTo: hstack.bottomAnchor, constant: 20),
            btnPreguntas.leadingAnchor.constraint(equalTo: scroll.frameLayoutGuide.leadingAnchor, constant: 20),
            btnPreguntas.trailingAnchor.constraint(equalTo: scroll.frameLayoutGuide.trailingAnchor, constant: -20),
            btnPreguntas.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            btnContacto.topAnchor.constraint(equalTo: btnPreguntas.bottomAnchor, constant: 10),
            btnContacto.leadingAnchor.constraint(equalTo: scroll.frameLayoutGuide.leadingAnchor, constant: 20),
            btnContacto.trailingAnchor.constraint(equalTo: scroll.frameLayoutGuide.trailingAnchor, constant: -20),
            btnContacto.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        scroll.contentLayoutGuide.widthAnchor.constraint(equalTo: scroll.frameLayoutGuide.widthAnchor, constant: 0).isActive = true
        scroll.contentLayoutGuide.heightAnchor.constraint(equalTo: scroll.frameLayoutGuide.heightAnchor, constant: 20).isActive = true
    }
    
    @IBAction func goProfile(_ sender: UIButton) {
        let alert = UIAlertController(title: "", message: "Perfil en construcción", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func preguntasFrecuentes() {
        let alert = UIAlertController(title: "", message: "Preguntas frecuentes en construcción", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func contacto() {
        let alert = UIAlertController(title: "", message: "Contacto en construcción", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func loadCatalogo() {
        let alert = UIAlertController(title: "", message: "Segue en construcción", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func loadCreacion() {
        let alert = UIAlertController(title: "", message: "Crea tu propio diseño en construcción", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func loadPedidos() {
        let alert = UIAlertController(title: "", message: "Segue en construcción", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func loadPromociones() {
        let alert = UIAlertController(title: "", message: "Promociones en construcción", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
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
