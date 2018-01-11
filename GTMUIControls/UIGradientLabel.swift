//
//  UIGradientLabel.swift
//  GTMUIControls
//  支持文字颜色渐变的Label
//
//  Created by 骆扬 on 2018/1/9.
//  Copyright © 2018年 LY. All rights reserved.
//

import UIKit

@IBDesignable
class UIGradientLabel: UILabel {
    
    @IBInspectable var isDirectionX: Bool = true {
        didSet {
            setGradientColor()
        }
    }
    @IBInspectable var from: UIColor = .white {
        didSet {
            setGradientColor()
        }
    }
    @IBInspectable var to: UIColor = .white {
        didSet {
            setGradientColor()
        }
    }
    
    func setGradientColor() {
        let size = intrinsicContentSize
        
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        let context = UIGraphicsGetCurrentContext()
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colors = [from.cgColor, to.cgColor]
        
        let gradient = CGGradient(colorsSpace: colorSpace, colors: colors as CFArray, locations: nil)
        let startPoint = CGPoint(x: 0, y: 0)
        let endPoint = CGPoint(x: isDirectionX ? size.width : size.height, y: 0)
        let opts = CGGradientDrawingOptions(rawValue: 0)
        // 第二个参数是起始位置，第三个参数是终止位置
        context?.drawLinearGradient(gradient!, start: startPoint, end: endPoint, options: opts)
        if let cgImage = UIGraphicsGetImageFromCurrentImageContext()?.cgImage {
            let image = UIImage.init(cgImage: cgImage)
            self.textColor = UIColor.init(patternImage: image)
        }
        
        UIGraphicsEndImageContext()
    }
    
}
