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
    
    func login() {
        MovieNightApi.postLoginUrl(responseHandler: self.handleResponse,
                                   errorHandler: self.handleError)
        
    }
    
    @IBAction func signInAction(_ sender: UIButton) {
        login()
    }
    func handleResponse(response: SigninResponse){
        if response.access == "true" {
         print("Logueado")
        }
    }
    
    
    func handleError(error: Error){
        let message = "Error on SignIn Response: \(error.localizedDescription)"
        os_log("%@", message)
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
