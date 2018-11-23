//
//  RegisterViewController.swift
//  iMovie_Night
//
//  Created by Katherin on 11/1/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit
import Alamofire
import os

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
        
        /*Alamofire.request(
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
        })*/
    }
    
    @IBAction func registerAction(_ sender: UIButton) {
        //register()
        let email: String = emailTextField.text!
        let password: String = passwordTextfield.text!
        let name: String = nameTextField.text!
        if !email.isEmpty && !password.isEmpty && !name.isEmpty {
            MovieNightApi.postRegister(Firstname: name, Email: email, Password: password, responseHandler: self.handleResponse, errorHandler: self.handleError)
        }else {
            let alert = UIAlertController(title: "Incomplete fields", message: "Firstname, Email and Password fields must be filled", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    func handleResponse(response: SignupResponse){
        if response.status == "ok"{
            performSegue(withIdentifier: "signupSegue", sender: nil)
            let tokenResponse = response.token!
            let tokenSeparated = tokenResponse.split(separator: " ")
            let token = tokenSeparated.first!
            let userId = Int(tokenSeparated.last!)
            print("UserId: \(userId!)")
            print("Token: \(token)")
            UserStore.shared.userId = userId!
            UserStore.shared.userToken = String (token)
            print("Registrado")
        }else if response.status == "exist"{
            let alert = UIAlertController(title: "Oopps", message: "This user already exist", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    func handleError(error: Error){
        let message = "Error on SignUp Response: \(error.localizedDescription)"
        os_log("%@", message)
        let alert = UIAlertController(title: "Oopps", message: "Something went wrong, please try again", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
