//
//  LoginVC.swift
//  Meraki
//
//  Created by Alberto Segura Sanchez on 26/05/22.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPass: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        /*for family: String in UIFont.familyNames {
                    print(family)
                    for names: String in UIFont.fontNames(forFamilyName: family)
                    {
                        print("== \(names)")
                    }
                }*/
    }
    
    @IBAction func forgotPass(_ sender: UIButton) {
        let alert = UIAlertController(title: "", message: "Olvidaste contraseña en construcción", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func register(_ sender: UIButton) {
        let alert = UIAlertController(title: "", message: "Registro en construcción", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func loginFace(_ sender: UIButton) {
        let alert = UIAlertController(title: "", message: "Login Facebook en construcción", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func loginGoogle(_ sender: UIButton) {
        let alert = UIAlertController(title: "", message: "Login Google en construcción", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func loginApple(_ sender: UIButton) {
        let alert = UIAlertController(title: "", message: "Login Apple en construcción", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        print(txtEmail.text!)
        print(txtPass.text!)
    }
    

}
