//
//  Coordinator.swift
//  CoordinatorPattern
//
//  Created by Maurice Fahn on 12.06.18.
//  Copyright © 2018 Maurice Fahn. All rights reserved.
//

import UIKit

protocol Coordinator {
    
    var context: UIViewController { get }
    var navigationController: UINavigationController? { get } // set }
    
    func push(_ viewController: UIViewController, animated: Bool)
    func present(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?)
    
    func start()
}

extension Coordinator {
    
    /** Pushes a view controller onto the receiver’s stack and updates the display. */
    func push(_ viewController: UIViewController, animated: Bool = false) {
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
    /** Presents a view controller modally. */
    func present(_ viewController: UIViewController, animated: Bool = false, completion: (() -> Void)? = nil) {
        context.present(viewController, animated: animated, completion: completion)
//        navigationController?.present(viewController, animated: animated, completion: completion)
    }
}
