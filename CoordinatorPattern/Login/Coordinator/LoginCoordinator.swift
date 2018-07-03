//
//  LoginCoordinator.swift
//  CoordinatorPattern
//
//  Created by Maurice Fahn on 12.06.18.
//  Copyright © 2018 Maurice Fahn. All rights reserved.
//

import UIKit
import os

class LoginCoordinator: Coordinator {
    var context: UIViewController
    var navigationController: UINavigationController?
    var delegate: LoginCoordinatorDelegate?
    
    init(context: UIViewController) {
        self.context = context
        os_log("Init %@", type: .debug, String(describing: type(of: self)))
    }
    
    deinit {
        os_log("Deinit %@", type: .debug, String(describing: type(of: self)))
    }
    
    func start() {
        let storyboard = UIStoryboard(name: LoginViewController.storyboardName, bundle: nil)
        let loginVC = storyboard.instantiateViewController(withIdentifier: LoginViewController.storyboardIdentifier) as! LoginViewController
        loginVC.delegate = self
        
        loginVC.modalTransitionStyle = .flipHorizontal
        
        present(loginVC, animated: false)
    }
}

extension LoginCoordinator: LoginViewControllerDelegate {
    func loginViewDidTapLogin(with credentials: Credentials, loginVC: LoginViewController) {
        
        UserDefaults.standard.set(true, forKey: "loggedIn")
        loginVC.dismiss(animated: false, completion: nil)
        delegate?.loginCoordinatorDidAuthenticate()
        
        /*
        // Ignore Credentials for now
        if credentials.username == "test" && credentials.password == "test" {
            UserDefaults.standard.set(true, forKey: "loggedIn")
            loginVC.dismiss(animated: true, completion: nil)
            delegate?.loginCoordinatorDidAuthenticate()
        }
         */
    }
}
