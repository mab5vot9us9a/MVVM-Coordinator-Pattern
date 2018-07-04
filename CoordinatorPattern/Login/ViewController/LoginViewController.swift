//
//  LoginViewController.swift
//  CoordinatorPattern
//
//  Created by Maurice Fahn on 12.06.18.
//  Copyright © 2018 Maurice Fahn. All rights reserved.
//

import UIKit
import os

class LoginViewController: UIViewController, UITextFieldDelegate {
    static let storyboardName: String = "Login"
    static let storyboardIdentifier: String = "loginVCID"
    
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    
    var delegate: LoginViewControllerDelegate?
    
    deinit {
        os_log("Deinit %@", type: .debug, String(describing: type(of: self)))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        os_log("viewDidLoad %@", type: .debug, String(describing: type(of: self)))
        
        // Do any additional setup after loading the view.
        usernameTextfield.delegate = self
        passwordTextfield.delegate = self
        
        logInButton.layer.cornerRadius = 5
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        os_log("viewDidAppear %@", type: .debug, String(describing: type(of: self)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        // Try to find next responder
        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            // Found next responder, so set it
            nextResponder.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard
            triggerLogin()
            textField.resignFirstResponder()
        }
        
        return false
    }
    
    @IBAction func triggerLogin() {
        
        /*
        // Ignore input validation for now
        guard let name = usernameTextfield.text, !name.isEmpty,
              let password = passwordTextfield.text, !password.isEmpty else {
            return
        }
         */
        
        delegate?.loginViewDidTapLogin(with: Credentials(username: usernameTextfield.text!, password: passwordTextfield.text!), loginVC: self)
    }
    
}
