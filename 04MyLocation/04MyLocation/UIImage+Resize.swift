//
//  UIImage+Resize.swift
//  04MyLocation
//
//  Created by Valiant on 2020/5/17.
//  Copyright © 2020 Valiant. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    func resize(withBounds bounds:CGSize) -> UIImage {
        let horizontalRatio = bounds.width/size.width
        let verticalRatio = bounds.height / size.height
        let ratio = min(horizontalRatio, verticalRatio)
        let newSize = CGSize(width: size.width * ratio, height: size.height * ratio)
        
        UIGraphicsBeginImageContextWithOptions(newSize, true, 0)
        draw(in: CGRect(origin: CGPoint.zero, size: newSize))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}
