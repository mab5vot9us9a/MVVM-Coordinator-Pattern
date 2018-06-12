//
//  OverviewTableViewController.swift
//  CoordinatorPattern
//
//  Created by Maurice Fahn on 12.06.18.
//  Copyright © 2018 Maurice Fahn. All rights reserved.
//

import UIKit

class OverviewTableViewController: UITableViewController {
    
    static let storyboardName: String = "Overview"
    static let storyboardIdentifier: String = "overviewTableVCID"
    
    fileprivate let cellReuseIdentifier: String = "overviewCell"
    
    var viewModel: OverviewListViewModel!
    var delegate: OverviewTableViewDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = viewModel.title
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)

        cell.textLabel?.text = viewModel.items[indexPath.row].description

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = viewModel.items[indexPath.row]
        
        delegate?.overviewTableViewController(didTapCell: item)
    }
}
