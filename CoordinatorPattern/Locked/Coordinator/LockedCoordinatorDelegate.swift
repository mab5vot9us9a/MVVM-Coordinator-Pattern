//
//  LockedCoordinatorDelegate.swift
//  CoordinatorPattern
//
//  Created by Maurice Fahn on 09.10.18.
//  Copyright © 2018 Maurice Fahn. All rights reserved.
//

import Foundation

protocol LockedViewControllerDelegate: class {
    func lockedViewDidTapUnlock(lockedVC: LockedViewController)
}
