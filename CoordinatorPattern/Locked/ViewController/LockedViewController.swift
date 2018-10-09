//
//  LockedViewController.swift
//  CoordinatorPattern
//
//  Created by Maurice Fahn on 09.10.18.
//  Copyright © 2018 Maurice Fahn. All rights reserved.
//

import UIKit
import os

class LockedViewController: UIViewController {
    static let storyboardName: String = "Locked"
    static let storyboardIdentifier: String = "lockedVCID"
    
    var delegate: LockedViewControllerDelegate?
    
    deinit {
        os_log("Deinit %@", type: .debug, String(describing: type(of: self)))
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        os_log("viewDidLoad %@", type: .debug, String(describing: type(of: self)))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        os_log("viewDidAppear %@", type: .debug, String(describing: type(of: self)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unlock(_ sender: Any) {
        os_log("Unlock")
        delegate?.lockedViewDidTapUnlock(lockedVC: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
