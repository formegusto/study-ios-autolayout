//
//  ViewController.swift
//  ch_4_custom_keyboard
//
//  Created by formegusto on 2022/01/07.
//

import UIKit

class ViewController: UIViewController, CustomKeyboardDelegate {

    @IBOutlet weak var firstTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 커스텀 키보드 뷰 설정방법
        // firstTextField.inputView = "커스텀 키보드 뷰";
        
        // firstTextField.inputView = CustomKeyboard()
        // XIB 정보를 불러온것
        let loadNib = Bundle.main.loadNibNamed("CustomKeyboard", owner: nil, options: nil)
        // Array 형태로 가지고 오면 되는데, 이는 해당 XIB 파일의
        // Structure 순서이다.
        let myKeyboardView = loadNib?.first as! CustomKeyboard
        
        firstTextField.inputView = myKeyboardView
        myKeyboardView.delegate = self
    }


}

extension ViewController {
    func keyboardTapped(str: String) {
        // let nowText = self.firstTextField.text
        
        // self.firstTextField.text = (nowText ?? "") + str
        let oldNumber = Int(self.firstTextField.text!)
        var newNumber = Int(str)
        
        if oldNumber != nil && str == "00" {
            newNumber = oldNumber! * 100
        }
        
        if oldNumber != nil && str == "000" {
            newNumber = oldNumber! * 1000
        }
        
        if let hasNumber = newNumber {
            // hasNumber는 newNumber에서 Optional이 빠진 값이 붙는다.
            // 쉼표 넣기
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            
            if let formatted = numberFormatter.string(from:  NSNumber(value:hasNumber)) {
                self.firstTextField.text = String(describing: formatted)
            }
        }
    }
}

