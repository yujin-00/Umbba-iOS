//
//  EntryViewController.swift
//  Umbba-iOS
//
//  Created by 고아라 on 2023/07/05.
//

import UIKit

final class EntryViewController: UIViewController {

    private let entryView = EntryView()
    
    override func loadView() {
        super.loadView()
        
        self.view = entryView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
    }

}

// MARK: - Extensions

extension EntryViewController {
    func setDelegate() {
        entryView.entryDelegate = self
    }
}

extension EntryViewController: EntryDelegate {
    func entryButtonTapped() {
        self.navigationController?.pushViewController(AnimationViewController(), animated: true)
    }
    
    func inviteButtonTapped() {
        let inviteViewController = InviteViewController()
        inviteViewController.isReceiver = true
        
        if LoginViewController.isMatch {
            self.navigationController?.pushViewController(AnimationViewController(), animated: true)
        } else {
            self.navigationController?.pushViewController(inviteViewController, animated: true)
        }
    }
}
