//
//  AuthViewController.swift
//  ProyectoFirebase
//
//  Created by Ezequiel Parada Beltran on 29/06/2020.
//  Copyright © 2020 Ezequiel Parada. All rights reserved.
//

import UIKit
import FirebaseAnalytics
import FirebaseAuth

class AuthViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Autenticación"
        // Analytics event
        Analytics.logEvent("InitScreen", parameters: ["message":"Integracion de Firebase Completa"])
    }

    @IBAction func signUpButtonAction(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                if let result = result, error == nil {
                    self.navigationController?.pushViewController(HomeViewController(email: result.user.email!, provider: .basic), animated: true)
                } else {
                    let alertController = UIAlertController(title: "Error", message: "Se ha producido un error registrando al usuario", preferredStyle: .alert)
                    
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    
                    self.present(alertController,animated: true,completion: nil)
                }
            }
        }
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if let result = result, error == nil {
                    self.navigationController?.pushViewController(HomeViewController(email: result.user.email!, provider: .basic), animated: true)
                } else {
                    let alertController = UIAlertController(title: "Error", message: "Se ha producido un error registrando al usuario", preferredStyle: .alert)
                    
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    
                    self.present(alertController,animated: true,completion: nil)
                }
            }
        }
    }
}

