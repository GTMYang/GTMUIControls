//
//  UICheckBox.swift
//  GTMUIControls
//
//  Created by 骆扬 on 2018/1/9.
//  Copyright © 2018年 LY. All rights reserved.
//

import UIKit
import SnapKit

@objc protocol UICheckBoxDelegate: class {
    func onChangedValue(sender: UICheckBox)
}

@IBDesignable
class UICheckBox: UIView {
    
    @IBOutlet weak var delegate: UICheckBoxDelegate?
    var iconImageV: UIImageView!
    var titleLabel: UILabel!
    
    @IBInspectable var isChecked: Bool = true {
        didSet {
            iconImageV.image = isChecked ? checkedIcon : unheckIcon
        }
    }
    @IBInspectable var checkedIcon: UIImage? {
        didSet {
            if isChecked {
                iconImageV.image = checkedIcon
            }
        }
    }
    @IBInspectable var unheckIcon: UIImage? {
        didSet {
            if !isChecked {
                iconImageV.image = unheckIcon
            }
        }
    }
    @IBInspectable var titleText: String = "" {
        didSet {
            titleLabel.text = titleText
        }
    }
    @IBInspectable var titleColor: UIColor = .black {
        didSet {
            titleLabel.textColor = titleColor
        }
    }
    @IBInspectable var titleSize: CGFloat = 13 {
        didSet {
            titleLabel.font = UIFont.systemFont(ofSize: titleSize)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        iconImageV = UIImageView()
        iconImageV.contentMode = .center
        self.addSubview(iconImageV)
        titleLabel = UILabel()
        titleLabel.textAlignment = .left
        self.addSubview(titleLabel)
        
        // layout
        
        iconImageV.snp.makeConstraints { (maker) in
            maker.left.equalTo(8)
            maker.centerY.equalToSuperview()
            maker.width.height.equalTo(15)
        }
        titleLabel.snp.makeConstraints { (maker) in
            maker.left.equalTo(iconImageV.snp.right).offset(8)
            maker.centerY.equalToSuperview()
            maker.height.equalTo(20)
            maker.right.equalToSuperview()
        }
        
        // 默认值
        isChecked = true
        
        //建立手势识别器
        let gesture = UITapGestureRecognizer(target: self, action: #selector(onTap(sender:)))
        //附加识别器到视图
        self.addGestureRecognizer(gesture)
    }
    // MARK: - Event
    @objc func onTap(sender: UITapGestureRecognizer) {
        isChecked = !isChecked
        delegate?.onChangedValue(sender: self)
    }
    
}
