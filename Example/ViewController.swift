//
//  ViewController.swift
//  Example
//
//  Created by 骆扬 on 2018/1/9.
//  Copyright © 2018年 LY. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK: - Table View
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var controller: UIViewController = UILineExap()
//        if indexPath.row == 0 {
//            // UILine
//           controller = UILineExap()
//        } else
        if indexPath.row == 1 {
            // UICowButton
            controller = UICowButtonExap()
        } else if indexPath.row == 2 {
            // CustomSwitch
            controller = CustomSwitchExap()
        } else if indexPath.row == 3 {
            // UICheckBox
            controller = UICheckBoxExap()
        } else if indexPath.row == 4 {
            // UIHead
            controller = UIHeadExap()
        } else if indexPath.row == 5 {
            // PositionableButton
            controller = PositionableButtonExap()
        } else if indexPath.row == 6 {
            // UIGradientLabel
            controller = UIGradientLabelExample()
        }
        self.navigationController?.pushViewController(controller, animated: true)
    }


}

