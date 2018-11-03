//
//  RegisterViewController.swift
//  iMovie_Night
//
//  Created by Katherin on 11/1/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit
import Alamofire

class RegisterViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func register() {
       let parameters = [
        "firstname": nameTextField.text!,
        "email": emailTextField.text!,
        "password": passwordTextfield.text!
        ]
        
        Alamofire.request(
            MovieNightApi.postRegisterUrl,
            method: .post,
            parameters: parameters
        ).validate()
        .responseJSON(completionHandler: { (response) in
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        })
    }
    
    @IBAction func registerAction(_ sender: UIButton) {
        //register()
    }
    
}
