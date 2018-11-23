//
//  CreateEventViewController.swift
//  iMovie_Night
//
//  Created by Kevin Ore on 11/22/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit
import os

class CreateEventViewController: UIViewController {

    @IBOutlet weak var EventName: UITextField!
    @IBOutlet weak var EventDescription: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func CreateEvent(_ sender: Any) {
        print("Created")
        print(UserStore.shared.userId)
        print(UserStore.shared.userToken)
        let name: String = EventName.text!
        let description: String = EventDescription.text!

        if !name.isEmpty{
            MovieNightApi.postEvent(Name: name, Description: description, responseHandler: handleResponse.self, errorHandler: handleError.self)
        }else {
            let alert = UIAlertController(title: "Incomplete fields", message: "Event name, field must be filled", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        /*let alert = UIAlertController(title: "Success", message: "Your event has been created", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Accept", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)*/
        
    }
    func handleResponse(response: PostResponse) {
        if response.status == "ok" {
            /*let alert = UIAlertController(title: "Success", message: "Your event has been created", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Accept", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)*/
            _ = navigationController?.popViewController(animated: true)
        }
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
