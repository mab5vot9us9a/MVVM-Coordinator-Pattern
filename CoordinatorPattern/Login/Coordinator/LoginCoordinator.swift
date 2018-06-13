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
//    var context: UIViewController
    var navigationController: UINavigationController
    var delegate: LoginCoordinatorDelegate?
    
    init(context: UINavigationController) {
        self.navigationController = context
//        self.navigationController = UINavigationController()
//        self.context.present(navigationController, animated: false, completion: nil)
        os_log("Init %@", type: .debug, String(describing: type(of: self)))
    }
    
    deinit {
        os_log("Deinit %@", type: .debug, String(describing: type(of: self)))
    }
    
    func start() {
        let storyboard = UIStoryboard(name: LoginViewController.storyboardName, bundle: nil)
        let loginVC = storyboard.instantiateViewController(withIdentifier: LoginViewController.storyboardIdentifier) as! LoginViewController
        loginVC.delegate = self

        DispatchQueue.main.async {
            self.present(loginVC, animated: false)
        }
//        context.present(navigationController, animated: false) { [weak self] in
//            DispatchQueue.main.async {
//                self?.present(loginVC, animated: false)
//            }
//        }
    }
}

extension LoginCoordinator: LoginViewControllerDelegate {
    func loginViewDidTapLogin(with credentials: Credentials, loginVC: LoginViewController) {
        if credentials.username == "test" && credentials.password == "test" {
            UserDefaults.standard.set(true, forKey: "loggedIn")
            loginVC.dismiss(animated: true, completion: nil)
            delegate?.loginCoordinatorDidAuthenticate()
        }
    }
}
