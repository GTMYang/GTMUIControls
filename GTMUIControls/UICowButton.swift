//
//  UICowButton.swift
//  GTMUIControls
//  自定义Button 可设置圆角，可设置阴影，可设置渐变背景色
//
//  Created by 骆扬 on 2018/1/9.
//  Copyright © 2018年 LY. All rights reserved.
//

import UIKit

@IBDesignable
public class UICowButton: UIButton {
    
    // MARK: - round
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            gradientLayer?.cornerRadius = cornerRadius
        }
    }
    
    // MARK: - gradient
    private var gradientLayer: CAGradientLayer?
    @IBInspectable var from: UIColor = .white {
        didSet {
            setGradient()
        }
    }
    @IBInspectable public var to: UIColor = .white {
        didSet {
            setGradient()
        }
    }
    @IBInspectable public var isGradientX: Bool = true {
        didSet {
            setGradient()
        }
    }
    func setGradient() {
        if let gLayer = gradientLayer  {
            gLayer.removeFromSuperlayer()
        }
        gradientLayer = CAGradientLayer()
        gradientLayer?.colors = [from.cgColor, to.cgColor]
        // gradientLayer.locations = [0, 1] // 默认就是均匀分布
        if isGradientX {
            gradientLayer?.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer?.endPoint = CGPoint(x: 1, y: 0)
        } else {
            gradientLayer?.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer?.endPoint = CGPoint(x: 0, y: 1)
        }
        gradientLayer?.frame = self.bounds
        gradientLayer?.cornerRadius = cornerRadius
        
        self.layer.insertSublayer(gradientLayer!, at: 0)
    }
    
    // MARK: shadow
    @IBInspectable var shadow: UIColor = .white {
        didSet {
            setShadow()
        }
    }
    func setShadow() {
        layer.shadowColor = shadow.cgColor
        layer.shadowOffset = CGSize.init(width: 0, height: 4)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 10
    }
    
    
}
