//
//  ViewController.swift
//  ch_9_switch_button
//
//  Created by formegusto on 2022/01/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchBtn: UIButton!
    @IBOutlet weak var switchBtnAlignX: NSLayoutConstraint!
    @IBOutlet weak var switchBg: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.switchBtn.layer.cornerRadius = self.switchBtn.bounds.height / 2
        self.switchBg.layer.cornerRadius = self.switchBtn.bounds.height / 2
        
        let tabGesture = UITapGestureRecognizer(target: self, action: #selector(clickSwitchBG))
        self.switchBg.addGestureRecognizer(tabGesture)
    }

    @objc func clickSwitchBG(sender: UITapGestureRecognizer) {
        if switchBtnAlignX.constant == 75 {
            // 왼쪽
            switchBtnAlignX.constant = -75
            switchBg.backgroundColor = .opaqueSeparator
        } else {
            // 오른쪽
            switchBtnAlignX.constant = 75
            switchBg.backgroundColor = .systemBlue.withAlphaComponent(0.3)
        }
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }

    @IBAction func clickSwitch(_ sender: UIButton) {
        if switchBtnAlignX.constant == 75 {
            // 왼쪽
            switchBtnAlignX.constant = -75
            switchBg.backgroundColor = .opaqueSeparator
        } else {
            // 오른쪽
            switchBtnAlignX.constant = 75
            switchBg.backgroundColor = .systemBlue.withAlphaComponent(0.3)
        }
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
}

