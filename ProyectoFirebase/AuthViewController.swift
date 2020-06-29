//
//  AuthViewController.swift
//  ProyectoFirebase
//
//  Created by Ezequiel Parada Beltran on 29/06/2020.
//  Copyright © 2020 Ezequiel Parada. All rights reserved.
//

import UIKit
import FirebaseAnalytics

class AuthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Autenticación"
        // Analytics event
        Analytics.logEvent("InitScreen", parameters: ["message":"Integracion de Firebase Completa"])
    }


}

