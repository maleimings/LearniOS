//
//  AboutViewController.swift
//  03Bullseye
//
//  Created by Valiant on 2020/5/1.
//  Copyright © 2020 Valiant. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!

    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }

}
