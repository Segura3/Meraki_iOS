//
//  DetalleVC.swift
//  Meraki
//
//  Created by Alberto Segura Sanchez on 24/05/22.
//

import UIKit

class DetalleVC: UIViewController {
    
    var receivedCatalogItem: SegueItem?
    
    var scroll: UIScrollView!
    var nameProd: UILabel!
    var btnShare: UIButton!
    var ivProducto: UIImageView!
    var boxProducto: OutlineBoxView!
    var descripcion: UILabel!
    var precioProd: UILabel!
    var cantidadLable: UILabel!
    var boxLine: UIView!
    var boxCantidad: UIView!
    var qtyPicker: UIPickerView!
    var btnComprarAhora: UIButton!
    var btnAgregarCartito: UIButton!
    //Stack stars
    var star1: UIImageView!
    var star2: UIImageView!
    var star3: UIImageView!
    var star4: UIImageView!
    var star5: UIImageView!
    var starStack: UIStackView!
    //Stack colors
    var colorLable: UILabel!
    var color1: UIButton!
    var color2: UIButton!
    var color3: UIButton!
    var colorStack: UIStackView!
    //Stack talla
    var tallaLable: UILabel!
    var tallaCH: UIButton!
    var tallaM: UIButton!
    var tallaG: UIButton!
    var tallaXG: UIButton!
    var tallaStack: UIStackView!
    
    let dataQty = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
        
        scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        
        nameProd = UILabel()
        nameProd.text = "Playera Raglan"
        nameProd.font = UIFont(name: "OpenSans-Medium", size: 20)
        nameProd.textAlignment = .left
        nameProd.translatesAutoresizingMaskIntoConstraints = false
        
        btnShare = UIButton(type: .system)
        btnShare.setBackgroundImage(UIImage(named: "Share"), for: .normal)
        btnShare.addTarget(self, action: #selector(share), for: .touchUpInside)
        btnShare.translatesAutoresizingMaskIntoConstraints = false
        
        ivProducto = UIImageView()
        ivProducto.image = UIImage(named: "Balcab")
        ivProducto.contentMode = .scaleAspectFit
        ivProducto.translatesAutoresizingMaskIntoConstraints = false
        
        boxProducto = OutlineBoxView()
        boxProducto.addSubview(ivProducto)
        
        descripcion = UILabel()
        descripcion.text = "Playera raglan corte Slim Fit con increíbles diseños para navidad!"
        descripcion.font = UIFont(name: "Domine-Regular", size: 16)
        descripcion.textAlignment = .left
        descripcion.numberOfLines = 0
        descripcion.translatesAutoresizingMaskIntoConstraints = false
        
        precioProd = UILabel()
        precioProd.text = "$ 220.00"
        precioProd.font = UIFont(name: "Domine-Regular", size: 24)
        precioProd.textAlignment = .left
        precioProd.translatesAutoresizingMaskIntoConstraints = false
        
        prepareStarStack()
        
        colorLable = UILabel()
        colorLable.text = "Color"
        colorLable.font = UIFont(name: "Domine-Medium", size: 20)
        colorLable.textAlignment = .left
        colorLable.translatesAutoresizingMaskIntoConstraints = false
        
        prepareColorStack()
        
        tallaLable = UILabel()
        tallaLable.text = "Talla"
        tallaLable.font = UIFont(name: "Domine-Medium", size: 20)
        tallaLable.textAlignment = .left
        tallaLable.translatesAutoresizingMaskIntoConstraints = false
        
        prepareTallaStack()
        
        cantidadLable = UILabel()
        cantidadLable.text = "Cantidad"
        cantidadLable.font = UIFont(name: "OpenSans-Medium", size: 20)
        cantidadLable.textAlignment = .left
        cantidadLable.translatesAutoresizingMaskIntoConstraints = false
        
        boxLine = UIView()
        boxLine.backgroundColor = UIColor.black
        boxLine.translatesAutoresizingMaskIntoConstraints = false
        
        qtyPicker = UIPickerView()
        qtyPicker.dataSource = self
        qtyPicker.delegate = self
        qtyPicker.translatesAutoresizingMaskIntoConstraints = false
        
        boxCantidad = UIView()
        boxCantidad.backgroundColor = UIColor(named: "Gray1")
        boxCantidad.addSubview(cantidadLable)
        boxCantidad.addSubview(boxLine)
        boxCantidad.addSubview(qtyPicker)
        boxCantidad.translatesAutoresizingMaskIntoConstraints = false
        
        btnComprarAhora = UIButton(type: .system)
        btnComprarAhora.setTitle("Comprar ahora", for: .normal)
        btnComprarAhora.setTitleColor(UIColor.black, for: .normal)
        btnComprarAhora.titleLabel?.font = UIFont(name: "Domine-Regular", size: 16)
        btnComprarAhora.backgroundColor = UIColor(named: "Blue400")
        btnComprarAhora.layer.cornerRadius = 10.0
        btnComprarAhora.translatesAutoresizingMaskIntoConstraints = false
        btnComprarAhora.addTarget(self, action: #selector(comprarAhora), for: .touchUpInside)
        
        btnAgregarCartito = UIButton(type: .system)
        btnAgregarCartito.setTitle("Agregar al carrito", for: .normal)
        btnAgregarCartito.setTitleColor(UIColor.black, for: .normal)
        btnAgregarCartito.titleLabel?.font = UIFont(name: "Domine-Regular", size: 16)
        btnAgregarCartito.backgroundColor = .clear
        btnAgregarCartito.layer.borderWidth = 1
        btnAgregarCartito.layer.borderColor = UIColor(named: "Blue400")?.cgColor
        btnAgregarCartito.layer.cornerRadius = 10.0
        btnAgregarCartito.translatesAutoresizingMaskIntoConstraints = false
        btnAgregarCartito.addTarget(self, action: #selector(agregarAlCarrito), for: .touchUpInside)
                
        scroll.addSubview(nameProd)
        scroll.addSubview(btnShare)
        scroll.addSubview(boxProducto)
        scroll.addSubview(descripcion)
        scroll.addSubview(precioProd)
        scroll.addSubview(starStack)
        scroll.addSubview(colorLable)
        scroll.addSubview(colorStack)
        scroll.addSubview(tallaLable)
        scroll.addSubview(tallaStack)
        scroll.addSubview(boxCantidad)
        scroll.addSubview(btnComprarAhora)
        scroll.addSubview(btnAgregarCartito)
        self.view.addSubview(scroll)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let item = self.receivedCatalogItem {
            self.nameProd.text = item.nombre
            self.precioProd.text = "$ " + item.precio
            self.ivProducto.image = item.foto
            //falta actualizar la descripcion
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        boxProducto.frame = CGRect(x: 20, y: 50, width: view.frame.width-40, height: 200)
        
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: view.topAnchor),
            scroll.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scroll.widthAnchor.constraint(equalTo: view.widthAnchor),
            scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nameProd.topAnchor.constraint(equalTo: scroll.topAnchor, constant: 10),
            nameProd.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 20),
            nameProd.trailingAnchor.constraint(equalTo: btnShare.leadingAnchor, constant: -10),
            nameProd.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            btnShare.topAnchor.constraint(equalTo: scroll.topAnchor, constant: 10),
            btnShare.trailingAnchor.constraint(equalTo: scroll.trailingAnchor, constant: -20),
            btnShare.widthAnchor.constraint(equalToConstant: 25),
            btnShare.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            ivProducto.topAnchor.constraint(equalTo: boxProducto.topAnchor, constant: 5),
            ivProducto.leadingAnchor.constraint(equalTo: boxProducto.leadingAnchor, constant: 5),
            ivProducto.trailingAnchor.constraint(equalTo: boxProducto.trailingAnchor, constant: -5),
            ivProducto.bottomAnchor.constraint(equalTo: boxProducto.bottomAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            descripcion.topAnchor.constraint(equalTo: boxProducto.bottomAnchor, constant: 16),
            descripcion.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 20),
            descripcion.trailingAnchor.constraint(equalTo: scroll.trailingAnchor, constant: -20),
            descripcion.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            precioProd.topAnchor.constraint(equalTo: descripcion.bottomAnchor, constant: 16),
            precioProd.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 40),
            precioProd.trailingAnchor.constraint(equalTo: starStack.leadingAnchor, constant: -10),
            precioProd.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            starStack.topAnchor.constraint(equalTo: descripcion.bottomAnchor, constant: 16),
            starStack.trailingAnchor.constraint(equalTo: scroll.trailingAnchor, constant: -20),
            starStack.widthAnchor.constraint(equalToConstant: 120),
            starStack.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            colorLable.topAnchor.constraint(equalTo: precioProd.bottomAnchor, constant: 20),
            colorLable.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 20),
            colorLable.widthAnchor.constraint(equalToConstant: 60),
            colorLable.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            colorStack.topAnchor.constraint(equalTo: colorLable.bottomAnchor, constant: 5),
            colorStack.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 20),
            colorStack.widthAnchor.constraint(equalToConstant: 110),
            colorStack.heightAnchor.constraint(equalToConstant: 30),
            color1.widthAnchor.constraint(equalToConstant: 30),
            color2.widthAnchor.constraint(equalToConstant: 30),
            color3.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            tallaLable.topAnchor.constraint(equalTo: colorStack.bottomAnchor, constant: 16),
            tallaLable.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 20),
            tallaLable.widthAnchor.constraint(equalToConstant: 60),
            tallaLable.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            tallaStack.topAnchor.constraint(equalTo: tallaLable.bottomAnchor, constant: 5),
            tallaStack.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 20),
            tallaStack.trailingAnchor.constraint(equalTo: scroll.trailingAnchor, constant: -view.frame.width/4),
            tallaStack.heightAnchor.constraint(equalToConstant: 30),
        ])
        
        NSLayoutConstraint.activate([
            boxCantidad.topAnchor.constraint(equalTo: tallaStack.bottomAnchor, constant: 16),
            boxCantidad.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 20),
            boxCantidad.trailingAnchor.constraint(equalTo: scroll.trailingAnchor, constant: -20),
            boxCantidad.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        NSLayoutConstraint.activate([
            cantidadLable.centerYAnchor.constraint(equalTo: boxCantidad.centerYAnchor),
            cantidadLable.leadingAnchor.constraint(equalTo: boxCantidad.leadingAnchor, constant: 30),
            cantidadLable.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            boxLine.centerYAnchor.constraint(equalTo: boxCantidad.centerYAnchor),
            boxLine.leadingAnchor.constraint(equalTo: cantidadLable.trailingAnchor, constant: 10),
            boxLine.widthAnchor.constraint(equalToConstant: 2),
            boxLine.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            qtyPicker.centerYAnchor.constraint(equalTo: boxCantidad.centerYAnchor),
            qtyPicker.leadingAnchor.constraint(equalTo: boxLine.trailingAnchor, constant: 5),
            qtyPicker.trailingAnchor.constraint(equalTo: boxCantidad.trailingAnchor, constant: -5),
            qtyPicker.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        NSLayoutConstraint.activate([
            btnComprarAhora.topAnchor.constraint(equalTo: boxCantidad.bottomAnchor, constant: 16),
            btnComprarAhora.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 20),
            btnComprarAhora.trailingAnchor.constraint(equalTo: scroll.trailingAnchor, constant: -20),
            btnComprarAhora.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            btnAgregarCartito.topAnchor.constraint(equalTo: btnComprarAhora.bottomAnchor, constant: 8),
            btnAgregarCartito.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 20),
            btnAgregarCartito.trailingAnchor.constraint(equalTo: scroll.trailingAnchor, constant: -20),
            btnAgregarCartito.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        scroll.contentLayoutGuide.widthAnchor.constraint(equalTo: scroll.frameLayoutGuide.widthAnchor, constant: 0).isActive = true
        scroll.contentLayoutGuide.heightAnchor.constraint(equalTo: scroll.frameLayoutGuide.heightAnchor, constant: 20).isActive = true
    }
    
    func prepareStarStack() {
        star1 = UIImageView(image: UIImage(named: "Star"))
        star1.frame.size.height = 10
        star1.frame.size.width = 10
        star1.contentMode = .scaleAspectFit
        star1.translatesAutoresizingMaskIntoConstraints = false
        
        star2 = UIImageView(image: UIImage(named: "Star"))
        star2.frame.size.height = 10
        star2.frame.size.width = 10
        star2.contentMode = .scaleAspectFit
        star2.translatesAutoresizingMaskIntoConstraints = false
        
        star3 = UIImageView(image: UIImage(named: "Star"))
        star3.frame.size.height = 10
        star3.frame.size.width = 10
        star3.contentMode = .scaleAspectFit
        star3.translatesAutoresizingMaskIntoConstraints = false
        
        star4 = UIImageView(image: UIImage(named: "Star"))
        star4.frame.size.height = 10
        star4.frame.size.width = 10
        star4.contentMode = .scaleAspectFit
        star4.translatesAutoresizingMaskIntoConstraints = false
        
        star5 = UIImageView(image: UIImage(named: "Star"))
        star5.frame.size.height = 10
        star5.frame.size.width = 10
        star5.contentMode = .scaleAspectFit
        star5.translatesAutoresizingMaskIntoConstraints = false
        
        starStack = UIStackView()
        starStack.axis = NSLayoutConstraint.Axis.horizontal
        starStack.distribution = .fillProportionally
        starStack.alignment = .center
        starStack.spacing = 1
        starStack.addArrangedSubview(star1)
        starStack.addArrangedSubview(star2)
        starStack.addArrangedSubview(star3)
        starStack.addArrangedSubview(star4)
        starStack.addArrangedSubview(star5)
        starStack.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func prepareColorStack() {
        color1 = UIButton(type: .system)
        color1.frame.size.width = 10
        color1.frame.size.height = 10
        color1.tag = 0
        color1.setBackgroundImage(UIImage(named: "CircleRed"), for: .normal)
        color1.addTarget(self, action: #selector(selectColor(_:)), for: .touchUpInside)
        color1.translatesAutoresizingMaskIntoConstraints = false
        
        color2 = UIButton(type: .system)
        color2.frame.size.width = 10
        color2.frame.size.height = 10
        color2.tag = 1
        color2.setBackgroundImage(UIImage(named: "CircleBlue"), for: .normal)
        color2.addTarget(self, action: #selector(selectColor(_:)), for: .touchUpInside)
        color2.translatesAutoresizingMaskIntoConstraints = false
        
        color3 = UIButton(type: .system)
        color3.frame.size.width = 10
        color3.frame.size.height = 10
        color3.tag = 1
        color3.setBackgroundImage(UIImage(named: "CircleBlack"), for: .normal)
        color3.addTarget(self, action: #selector(selectColor(_:)), for: .touchUpInside)
        color3.translatesAutoresizingMaskIntoConstraints = false
        
        colorStack = UIStackView()
        colorStack.axis = NSLayoutConstraint.Axis.horizontal
        colorStack.distribution = .fillProportionally
        colorStack.alignment = .center
        colorStack.spacing = 10
        colorStack.addArrangedSubview(color1)
        colorStack.addArrangedSubview(color2)
        colorStack.addArrangedSubview(color3)
        colorStack.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func prepareTallaStack() {
        tallaCH = UIButton(type: .custom)
        tallaCH.setTitle("CH", for: .normal)
        tallaCH.setTitleColor(UIColor.black, for: .normal)
        tallaCH.setTitleColor(UIColor.white, for: .selected)
        tallaCH.backgroundColor = .clear
        tallaCH.layer.cornerRadius = 14
        tallaCH.layer.borderWidth = 1
        tallaCH.tag = 0
        tallaCH.layer.borderColor = UIColor(named: "Blue600")?.cgColor
        tallaCH.addTarget(self, action: #selector(self.tallaSelection(_:)), for: .touchUpInside)
        tallaCH.translatesAutoresizingMaskIntoConstraints = false
        
        tallaM = UIButton(type: .custom)
        tallaM.setTitle("M", for: .normal)
        tallaM.setTitleColor(UIColor.black, for: .normal)
        tallaM.setTitleColor(UIColor.white, for: .selected)
        tallaM.backgroundColor = .clear
        tallaM.layer.cornerRadius = 14
        tallaM.layer.borderWidth = 1
        tallaM.tag = 1
        tallaM.layer.borderColor = UIColor(named: "Blue600")?.cgColor
        tallaM.addTarget(self, action: #selector(self.tallaSelection(_:)), for: .touchUpInside)
        tallaM.translatesAutoresizingMaskIntoConstraints = false
        
        tallaG = UIButton(type: .custom)
        tallaG.setTitle("G", for: .normal)
        tallaG.setTitleColor(UIColor.black, for: .normal)
        tallaG.setTitleColor(UIColor.white, for: .selected)
        tallaG.backgroundColor = .clear
        tallaG.layer.cornerRadius = 14
        tallaG.layer.borderWidth = 1
        tallaG.tag = 2
        tallaG.layer.borderColor = UIColor(named: "Blue600")?.cgColor
        tallaG.addTarget(self, action: #selector(self.tallaSelection(_:)), for: .touchUpInside)
        tallaG.translatesAutoresizingMaskIntoConstraints = false
        
        tallaXG = UIButton(type: .custom)
        tallaXG.setTitle("XG", for: .normal)
        tallaXG.setTitleColor(UIColor.black, for: .normal)
        tallaXG.setTitleColor(UIColor.white, for: .selected)
        tallaXG.backgroundColor = .clear
        tallaXG.layer.cornerRadius = 14
        tallaXG.layer.borderWidth = 1
        tallaXG.tag = 3
        tallaXG.layer.borderColor = UIColor(named: "Blue600")?.cgColor
        tallaXG.addTarget(self, action: #selector(self.tallaSelection(_:)), for: .touchUpInside)
        tallaXG.translatesAutoresizingMaskIntoConstraints = false
        
        tallaStack = UIStackView()
        tallaStack.axis = NSLayoutConstraint.Axis.horizontal
        tallaStack.distribution = .fillEqually
        tallaStack.alignment = .leading
        tallaStack.spacing = 10
        tallaStack.addArrangedSubview(tallaCH)
        tallaStack.addArrangedSubview(tallaM)
        tallaStack.addArrangedSubview(tallaG)
        tallaStack.addArrangedSubview(tallaXG)
        tallaStack.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setNavigationBar() {
        
        self.navigationItem.title = .none

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
    
    @objc func selectColor(_ sender: UIButton) {
        let alert = UIAlertController(title: "", message: "Seleccionar color en construcción", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func tallaSelection(_ sender: UIButton) {
        switch sender.tag {
            case 0:
                if tallaCH.isSelected == true {
                    tallaCH.isSelected = false
                    tallaCH.backgroundColor = .clear
                }else {
                    tallaCH.isSelected = true
                    tallaCH.backgroundColor = UIColor(named: "Blue600")
                    tallaM.isSelected = false
                    tallaM.backgroundColor = .clear
                    tallaG.isSelected = false
                    tallaG.backgroundColor = .clear
                    tallaXG.isSelected = false
                    tallaXG.backgroundColor = .clear
                }
            case 1:
                if tallaM.isSelected == true {
                    tallaM.isSelected = false
                    tallaM.backgroundColor = .clear
                }else {
                    tallaM.isSelected = true
                    tallaM.backgroundColor = UIColor(named: "Blue600")
                    tallaCH.isSelected = false
                    tallaCH.backgroundColor = .clear
                    tallaG.isSelected = false
                    tallaG.backgroundColor = .clear
                    tallaXG.isSelected = false
                    tallaXG.backgroundColor = .clear
                }
            case 2:
                if tallaG.isSelected == true {
                    tallaG.isSelected = false
                    tallaG.backgroundColor = .clear
                }else {
                    tallaG.isSelected = true
                    tallaG.backgroundColor = UIColor(named: "Blue600")
                    tallaM.isSelected = false
                    tallaM.backgroundColor = .clear
                    tallaCH.isSelected = false
                    tallaCH.backgroundColor = .clear
                    tallaXG.isSelected = false
                    tallaXG.backgroundColor = .clear
                }
            case 3:
                if tallaXG.isSelected == true {
                    tallaXG.isSelected = false
                    tallaXG.backgroundColor = .clear
                }else {
                    tallaXG.isSelected = true
                    tallaXG.backgroundColor = UIColor(named: "Blue600")
                    tallaM.isSelected = false
                    tallaM.backgroundColor = .clear
                    tallaG.isSelected = false
                    tallaG.backgroundColor = .clear
                    tallaCH.isSelected = false
                    tallaCH.backgroundColor = .clear
                }
            default:
                print("Talla NA")
        }
    }
    
    @objc func agregarAlCarrito() {
        let alert = UIAlertController(title: "", message: "Agregado al carrito", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func share() {
        let alert = UIAlertController(title: "", message: "Share en construcción", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let vc = segue.destination as? CarritoVC
        vc?.hidesBottomBarWhenPushed = false
    }
    
    @objc func backToMain() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func comprarAhora() {
        //falta vover a activar el TabBar
        //self.performSegue(withIdentifier: "detalleToCarrito", sender: nil)
        let alert = UIAlertController(title: "", message: "Comprar ahora en construcción", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}

extension DetalleVC: UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataQty.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let row = String(dataQty[row])
        return row
    }
    
}
