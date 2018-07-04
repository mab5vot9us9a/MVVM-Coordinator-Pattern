//
//  OverviewTableViewController.swift
//  CoordinatorPattern
//
//  Created by Maurice Fahn on 12.06.18.
//  Copyright © 2018 Maurice Fahn. All rights reserved.
//

import UIKit
import os

class OverviewTableViewController: UITableViewController {
    
    static let storyboardName: String = "Overview"
    static let storyboardIdentifier: String = "overviewTableVCID"
    
    fileprivate let cellReuseIdentifier: String = "overviewCell"
    
    var viewModel: OverviewListViewModel!
    var delegate: OverviewTableViewDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = viewModel.title
        
        setupLogoutButton()
        
        os_log("viewDidLoad %@", type: .debug, String(describing: type(of: self)))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        os_log("viewDidAppear %@", type: .debug, String(describing: type(of: self)))
    }
    
    deinit {
        os_log("Deinit %@", type: .debug, String(describing: type(of: self)))
    }
    
    // MARK: - UI Setup
    
    fileprivate func setupLogoutButton() {
        let logoutButton = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(self.logOut))
        self.navigationItem.rightBarButtonItem = logoutButton
    }
    
    @objc func logOut() {
        delegate?.overviewTableViewController(didTapLogOut: self)
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
