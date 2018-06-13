//
//  OverviewCoordinatorDelegates.swift
//  CoordinatorPattern
//
//  Created by Maurice Fahn on 12.06.18.
//  Copyright © 2018 Maurice Fahn. All rights reserved.
//

import UIKit

protocol OverviewTableViewDelegate: class {
    func overviewTableViewController(didTapCell item: OverviewViewModel)
    func overviewTableViewController(didTapLogOut viewController: OverviewTableViewController)
}
