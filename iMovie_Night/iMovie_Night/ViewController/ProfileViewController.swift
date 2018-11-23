//
//  ProfileViewController.swift
//  iMovie_Night
//
//  Created by Luis Galindo on 11/9/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var pictureImageView: UIImageView!
    //@IBOutlet weak var firstnameLabel: UILabel!
    
    
    let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZGQiOjcxLCJzdWIiOiJDZXNhckNhc0Bob3RtYWlsLmNvbSIsInB3ZCI6Im1pdXBjLjQ1Ni4iLCJwaG8iOiI5MTQ4NzI4MzMifQ.76V1nfjgq2Jk8txT_KezUwFcHaOmt_ZDW2dzviY0qS0"
    let user_id = 71
    
    //@IBOutlet weak var lastnameLabel: UILabel!
    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var cancelItem: UIBarButtonItem!
    @IBOutlet weak var saveEdit: UIBarButtonItem!
    
    //@IBOutlet weak var emailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        MovieNightApi.getMyUser(token: token, user_id: user_id, responseHandler: handleResponse)
    }
    
    private func handleResponse(response: User){
        pictureImageView.setImage(fromUrlString: response.image_url!, withDefaultNamed: "no-image-available", withErrorName: "no-image-available")
        firstnameTextField.text = response.firstname
        lastnameTextField.text = response.lastname
        emailTextField.text = response.email
    }
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        
    }
}
