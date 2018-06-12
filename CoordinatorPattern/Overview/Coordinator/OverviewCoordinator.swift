//
//  OverviewCoordinator.swift
//  CoordinatorPattern
//
//  Created by Maurice Fahn on 12.06.18.
//  Copyright © 2018 Maurice Fahn. All rights reserved.
//

import Foundation
import UIKit

class OverviewCoordinator: Coordinator {
    // MARK: - Coordinator
    var navigationController: UINavigationController
    
    public init(context: UINavigationController) {
        self.navigationController = context
    }
    
    func start() {
        showOverview()
    }
    
    fileprivate func showOverview() {
        let viewModel = OverviewListViewModel(items: [OverviewViewModel(item: OverviewItem(id: 0)),
                                                                  OverviewViewModel(item: OverviewItem(id: 1)),
                                                                  OverviewViewModel(item: OverviewItem(id: 2)),
                                                                  OverviewViewModel(item: OverviewItem(id: 3)),
                                                                  OverviewViewModel(item: OverviewItem(id: 4)),
                                                                  OverviewViewModel(item: OverviewItem(id: 5)),
                                                                  OverviewViewModel(item: OverviewItem(id: 6)),
                                                                  OverviewViewModel(item: OverviewItem(id: 7)),
                                                                  OverviewViewModel(item: OverviewItem(id: 8)),
                                                                  OverviewViewModel(item: OverviewItem(id: 9))])
        
        let storyboard = UIStoryboard(name: OverviewTableViewController.storyboardName, bundle: nil)
        let overviewTableVC = storyboard.instantiateViewController(withIdentifier: OverviewTableViewController.storyboardIdentifier) as! OverviewTableViewController
        overviewTableVC.viewModel = viewModel
        overviewTableVC.delegate = self
        
        push(overviewTableVC)
    }
}

extension OverviewCoordinator: OverviewTableViewDelegate {
    func overviewTableViewController(didTapCell item: OverviewViewModel) {
        showDetails(item)
    }
    
    fileprivate func showDetails(_ item: OverviewViewModel) {
        let storyboard = UIStoryboard(name: OverviewDetailsViewController.storyboard, bundle: nil)
        let overviewDetailsVC = storyboard.instantiateViewController(withIdentifier: OverviewDetailsViewController.storyboardIdentifier) as! OverviewDetailsViewController
        
        overviewDetailsVC.viewModel = item
        
        push(overviewDetailsVC)
    }
}

