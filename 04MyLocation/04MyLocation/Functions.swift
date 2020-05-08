//
//  Functions.swift
//  04MyLocation
//
//  Created by Valiant on 2020/5/7.
//  Copyright © 2020 Valiant. All rights reserved.
//

import Foundation


func afterDelay(_ seconds: Double, run: @escaping () -> Void) {
     DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: run)
}


let applicationDocumentsDirectory: URL = {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    
    return paths[0]
}()
