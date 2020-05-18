//
//  String+AddText.swift
//  04MyLocation
//
//  Created by Valiant on 2020/5/18.
//  Copyright © 2020 Valiant. All rights reserved.
//

import Foundation

extension String {
    mutating func add(text: String?, separatedBy separator: String) {
        if let text = text {
            if !isEmpty {
                self += separator
            } else {
                self += text
            }
        }
    }
}
