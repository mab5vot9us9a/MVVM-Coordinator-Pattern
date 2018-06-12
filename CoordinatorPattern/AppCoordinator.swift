//
//  AppCoordinator.swift
//  CoordinatorPattern
//
//  Created by Maurice Fahn on 12.06.18.
//  Copyright © 2018 Maurice Fahn. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
//    var context: UIViewController
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = [Coordinator]()
    
    init(context: UINavigationController) {
        self.navigationController = context
    }
    
    func start() {
        let loggedIn = {return true}()
        
        if loggedIn {
            showOverview()
        } else {
            showLogin()
        }
    }
    
    fileprivate func showOverview() {
        let overviewCoordinator = OverviewCoordinator(context: navigationController)
        self.childCoordinators.append(overviewCoordinator)
        overviewCoordinator.start()
    }
    
    fileprivate func showLogin() {
        
    }
}
