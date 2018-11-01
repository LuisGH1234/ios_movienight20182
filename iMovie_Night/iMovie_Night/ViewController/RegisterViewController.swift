//
//  RegisterViewController.swift
//  iMovie_Night
//
//  Created by Katherin on 11/1/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func register() {
       /*let parameters = [
        "firstname": nameTextField.text!,
        "email": emailTextField.text!,
        "password": passwordTextfield.text!
        ]*/
        
    }
    
    @IBAction func createAccount(_ sender: UIButton) {
        register()
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
