//
//  AppCoordinatorDelegates.swift
//  CoordinatorPattern
//
//  Created by Maurice Fahn on 12.06.18.
//  Copyright © 2018 Maurice Fahn. All rights reserved.
//

import Foundation

protocol LoginCoordinatorDelegate {
    func loginCoordinatorDidAuthenticate()
}

protocol OverviewCoordinatorDelegate {
    func overviewCoordinatorDidLogOut()
}
