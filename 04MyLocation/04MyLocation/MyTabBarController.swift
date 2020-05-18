//
//  MyTabBarController.swift
//  04MyLocation
//
//  Created by Valiant on 2020/5/18.
//  Copyright © 2020 Valiant. All rights reserved.
//

import Foundation
import UIKit

class MyTabBarController: UITabBarController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var childForStatusBarStyle: UIViewController? {
        return nil
    }
}
