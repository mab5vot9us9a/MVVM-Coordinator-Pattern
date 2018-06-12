//
//  LoginViewController.swift
//  CoordinatorPattern
//
//  Created by Maurice Fahn on 12.06.18.
//  Copyright © 2018 Maurice Fahn. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    static let storyboardName: String = "Login"
    static let storyboardIdentifier: String = "loginVCID"
    
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    var delegate: LoginViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        usernameTextfield.delegate = self
        passwordTextfield.delegate = self
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

    func triggerLogin() {
        
        guard let name = usernameTextfield.text, !name.isEmpty,
              let password = passwordTextfield.text, !password.isEmpty else {
            return
        }
        
        delegate?.loginViewDidTapLogin(with: Credentials(username: usernameTextfield.text!, password: passwordTextfield.text!), loginVC: self)
    }
    
}
