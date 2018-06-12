//
//  LoginCoordinator.swift
//  CoordinatorPattern
//
//  Created by Maurice Fahn on 12.06.18.
//  Copyright © 2018 Maurice Fahn. All rights reserved.
//

import UIKit

class LoginCoordinator: Coordinator {
    var context: UIViewController
    var navigationController: UINavigationController
    var delegate: LoginCoordinatorDelegate?
    
    init(context: UIViewController) {
        self.context = context
        self.navigationController = UINavigationController()
//        self.context.present(navigationController, animated: false, completion: nil)
    }
    
    func start() {
        let storyboard = UIStoryboard(name: LoginViewController.storyboardName, bundle: nil)
        let loginVC = storyboard.instantiateViewController(withIdentifier: LoginViewController.storyboardIdentifier) as! LoginViewController
        loginVC.delegate = self
        
        context.present(navigationController, animated: false) { [weak self] in
            self?.present(loginVC, animated: false)
        }
    }
}

extension LoginCoordinator: LoginViewControllerDelegate {
    func loginViewDidTapLogin(with credentials: Credentials, loginVC: LoginViewController) {
        if credentials.username == "test" && credentials.password == "test" {
            UserDefaults.standard.set(true, forKey: "loggedIn")
            navigationController.dismiss(animated: true, completion: nil)
            delegate?.loginCoordinatorDidAuthenticate()
        }
    }
}
