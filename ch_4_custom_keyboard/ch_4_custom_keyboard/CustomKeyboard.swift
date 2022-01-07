//
//  CustomKeyboard.swift
//  ch_4_custom_keyboard
//
//  Created by formegusto on 2022/01/07.
//

import UIKit

// delegate
// 기능이나 값을 위임한다.

protocol CustomKeyboardDelegate {
    func keyboardTapped(str:String)
}

class CustomKeyboard: UIView {
    
    var delegate: CustomKeyboardDelegate?
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        if let hasText = sender.titleLabel?.text {
            delegate?.keyboardTapped(str: hasText)
        }
    }
}
