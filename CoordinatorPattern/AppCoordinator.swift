//
//  AppCoordinator.swift
//  CoordinatorPattern
//
//  Created by Maurice Fahn on 12.06.18.
//  Copyright © 2018 Maurice Fahn. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var context: UIViewController
    var navigationController: UINavigationController
    
    var currentCoordinator: Coordinator?
    
    init(context: UIViewController) {
        self.context = context
        self.navigationController = UINavigationController()
//        self.context.present(navigationController, animated: false, completion: nil)
    }
    
    func start() {
        let loggedIn = UserDefaults.standard.bool(forKey: "loggedIn")
        
        if loggedIn {
            showOverview()
        } else {
            showLogin()
        }
    }
    
    fileprivate func showOverview() {
        let overviewCoordinator = OverviewCoordinator(context: context)
        overviewCoordinator.delegate = self
        self.currentCoordinator = overviewCoordinator
        overviewCoordinator.start()
    }
    
    fileprivate func showLogin() {
        let loginCoordinator = LoginCoordinator(context: context)
        loginCoordinator.delegate = self
        self.currentCoordinator = loginCoordinator
        loginCoordinator.start()
    }
}

extension AppCoordinator: OverviewCoordinatorDelegate {
    func overviewCoordinatorDidLogOut() {
        self.currentCoordinator = nil
        showLogin()
    }
}

extension AppCoordinator: LoginCoordinatorDelegate {
    func loginCoordinatorDidAuthenticate() {
        self.currentCoordinator = nil
        showOverview()
    }
}
