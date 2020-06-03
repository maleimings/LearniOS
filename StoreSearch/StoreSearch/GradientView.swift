//
//  GradientView.swift
//  StoreSearch
//
//  Created by Valiant on 2020/6/3.
//  Copyright © 2020 Valiant. All rights reserved.
//

import Foundation
import UIKit

class GradientView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        backgroundColor = UIColor.clear
    }
    
    override func draw(_ rect: CGRect) { // 1
        let components: [CGFloat] = [ 0, 0, 0, 0.3, 0, 0, 0, 0.7 ]
        let locations: [CGFloat] = [ 0, 1 ]
        // 2
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let gradient = CGGradient(colorSpace: colorSpace,
                       colorComponents: components,
        // 3
        locations: locations, count: 2)
        let x = bounds.midX
        let y = bounds.midY
        let centerPoint = CGPoint(x: x, y : y)
        let radius = max(x, y)
        // 4
        let context = UIGraphicsGetCurrentContext()
        context?.drawRadialGradient(gradient!,
            startCenter: centerPoint, startRadius: 0,
            endCenter: centerPoint, endRadius: radius, options: .drawsAfterEndLocation)
    }
}
