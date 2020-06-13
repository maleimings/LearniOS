//
//  MenuViewController.swift
//  StoreSearch
//
//  Created by Valiant on 2020/6/13.
//  Copyright © 2020 Valiant. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {
    weak var delegate: MenuViewControllerDelegate?
    
    override func viewDidLoad() {
      super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            delegate?.menuViewControllerSendEmail(self)
        }
    }
}

protocol MenuViewControllerDelegate: class {
    func menuViewControllerSendEmail(_ controller: MenuViewController)
}
