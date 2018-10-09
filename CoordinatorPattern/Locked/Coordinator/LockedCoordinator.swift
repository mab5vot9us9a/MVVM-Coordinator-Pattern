//
//  LockedCoordinator.swift
//  CoordinatorPattern
//
//  Created by Maurice Fahn on 09.10.18.
//  Copyright © 2018 Maurice Fahn. All rights reserved.
//

import UIKit
import os

class LockedCoordinator: Coordinator {
    var context: UIViewController
    weak var navigationController: UINavigationController?
    var delegate: LockedCoordinatorDelegate?
    
    init(context: UIViewController) {
        self.context = context
        os_log("Init %@", type: .debug, String(describing: type(of: self)))
    }
    
    deinit {
        os_log("Deinit %@", type: .debug, String(describing: type(of: self)))
    }
    
    func start() {
        let storyboard = UIStoryboard(name: LockedViewController.storyboardName, bundle: nil)
        let lockedVC = storyboard.instantiateViewController(withIdentifier: LockedViewController.storyboardIdentifier) as! LockedViewController
        lockedVC.delegate = self
        
        //        present(loginVC, animated: false)
        AppDelegate.appDelegate.window?.rootViewController = lockedVC
        AppDelegate.appDelegate.window?.makeKeyAndVisible()
    }
}

// MARK: - Delegate Implementations

extension LockedCoordinator: LockedViewControllerDelegate {
    func lockedViewDidTapUnlock(lockedVC: LockedViewController) {
        UserDefaults.standard.set(false, forKey: "locked")
        delegate?.lockedCoordinatorDidUnlock()
    }
    
    
}
