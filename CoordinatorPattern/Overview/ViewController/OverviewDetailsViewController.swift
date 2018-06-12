//
//  OverviewDetailsViewController.swift
//  CoordinatorPattern
//
//  Created by Maurice Fahn on 12.06.18.
//  Copyright © 2018 Maurice Fahn. All rights reserved.
//

import UIKit

class OverviewDetailsViewController: UIViewController {
    
    static let storyboard: String = "Overview"
    static let storyboardIdentifier: String = "overviewDetailsVCID"
    
    @IBOutlet weak var textLabel: UILabel!
    
    var viewModel: OverviewViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = viewModel.title
        textLabel.text = viewModel.description
    }
}
