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
            MovieNightApi.postLoginUrl,
            method: .post,
            parameters: parameters
        ).validate()
            .responseJSON(completionHandler: { (response) in
                switch response.result {
                case .success(let value):
                    do{
                        let data = try JSONSerialization.data(
                            withJSONObject: value, options: .prettyPrinted)
                    
                    }catch{
                        print("\(error)")
                    }
                case .failure(let error):
                    print("Error while requesting Data: \(error.localizedDescription)")
                }
                })
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
