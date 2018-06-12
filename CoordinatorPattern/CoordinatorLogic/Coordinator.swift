//
//  Coordinator.swift
//  CoordinatorPattern
//
//  Created by Maurice Fahn on 12.06.18.
//  Copyright © 2018 Maurice Fahn. All rights reserved.
//

import UIKit

protocol Coordinator {
    
//    var context: UIViewController { get }
    var navigationController: UINavigationController { get }
    
    func push(_ viewController: UIViewController)
    func present(_ viewController: UIViewController)
    
    func start()
}

extension Coordinator {
    
    /** Pushes a view controller onto the receiver’s stack and updates the display. */
    func push(_ viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)
    }
    
    /** Presents a view controller modally. */
    func present(_ viewController: UIViewController) {
        navigationController.present(viewController, animated: true, completion: nil)
    }
}
