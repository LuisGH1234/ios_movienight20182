//
//  LoginViewController.swift
//  iMovie_Night
//
//  Created by Katherin on 11/1/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit
import os

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginAction(_ sender: Any) {
        let email: String = emailTextField.text!
        let password: String = passwordTextField.text!
        if !email.isEmpty && !password.isEmpty {
            MovieNightApi.postLogin(Email: email, Password: password, responseHandler: self.handleResponse, errorHandler: self.handleError)
        }else {
            let alert = UIAlertController(title: "Incomplete fields", message: "Email and Password fields must be filled", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    func handleResponse(response: SigninResponse) -> Bool {
        print(response.access)
        if response.access == "true" {
            performSegue(withIdentifier: "signinSegue", sender: nil)
            print("Logueado")
            return true
        }
        let alert = UIAlertController(title: "Oopps", message: "Something went wrong, please try again", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        return false
    }
    
    
    func handleError(error: Error){
        let message = "Error on SignIn Response: \(error.localizedDescription)"
        os_log("%@", message)
        let alert = UIAlertController(title: "Oopps", message: "Something went wrong, please try again", preferredStyle: UIAlertController.Style.alert)
         alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertAction.Style.default, handler: nil))
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
