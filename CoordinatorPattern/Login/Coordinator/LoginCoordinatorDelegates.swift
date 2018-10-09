//
//  /Users/maurice/Library/Mobile Documents/3L68KQB4HG~com~readdle~CommonDocuments/Documents/Other/Scrum/Scrum.Finished_1.htmlLoginCoordinatorDelegates.swift
//  CoordinatorPattern
//
//  Created by Maurice Fahn on 12.06.18.
//  Copyright © 2018 Maurice Fahn. All rights reserved.
//

import Foundation

protocol LoginViewControllerDelegate: class {
    func loginViewDidTapLogin(with credentials: Credentials, loginVC: LoginViewController)
}
