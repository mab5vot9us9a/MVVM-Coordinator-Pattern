//
//  AppCoordinator.swift
//  CoordinatorPattern
//
//  Created by Maurice Fahn on 12.06.18.
//  Copyright © 2018 Maurice Fahn. All rights reserved.
//

import UIKit
import os

class AppCoordinator: Coordinator {
    
    var context: UIViewController
    var navigationController = UINavigationController()
    
    var currentCoordinator: Coordinator? // Needed so object doesn't get deallocated
    
    init(context: UIViewController) {
        self.context = context
        self.context.present(navigationController, animated: false, completion: nil)
        os_log("Init %@", type: .debug, String(describing: type(of: self)))
    }
    
    deinit {
        os_log("Deinit %@", type: .debug, String(describing: type(of: self)))
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
        let overviewCoordinator = OverviewCoordinator(context: self.navigationController)
        overviewCoordinator.delegate = self
        overviewCoordinator.start()
        
        self.currentCoordinator = overviewCoordinator
    }
    
    fileprivate func showLogin() {
        let loginCoordinator = LoginCoordinator(context: self.navigationController)
        loginCoordinator.delegate = self
        loginCoordinator.start()
        
        self.currentCoordinator = loginCoordinator
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
