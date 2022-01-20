//
//  ViewController.swift
//  ch_11_signin
//
//  Created by formegusto on 2022/01/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    
    var emailErrorHeight: NSLayoutConstraint!
    var passwordErrorHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // textField 값이 변경되는 걸 캐치
        // 기본적으로 셋팅 되어 있지 않아서 직접 설정해야 한다. (delegate 에 설정되어 있지 않음 )
        // 첫 매개변수에는 ViewController
        // selector 는 object c에서 호환이 되지 않는 함수이기 때문에,
        // objc에서 사용할 수 있도록 연결할 수 있도록 설정하는 개념이다.
        self.emailTF.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged)
        self.passwordTF.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged)
        
        self.emailErrorHeight = emailErrorLabel.heightAnchor.constraint(equalToConstant: 0)
        self.passwordErrorHeight = passwordErrorLabel.heightAnchor.constraint(equalToConstant: 0)
    }
    
    @objc func textFieldEdited(_ sender: UITextField) {
        if sender == emailTF {
            print("email text field changed : \(sender.text!)")
            
            if isValidEmail(email: sender.text) == true {
                // 에러 표시가 안나와야 함
                self.emailErrorHeight.isActive = true
            } else {
                self.emailErrorHeight.isActive = false
            }
        } else if sender == passwordTF {
            print("password text field changed. \(sender.text!)")
            
            if isValidPassword(password: sender.text) {
                self.passwordErrorHeight.isActive = true
            } else {
                self.passwordErrorHeight.isActive = false
            }
        }
        
        UIView.animate(withDuration: 0.1) {
            self.view.layoutIfNeeded()
        }
    }

    // 이메일 정규식 - regular expression
    func isValidEmail(email: String?) -> Bool {
        guard email != nil else {
            return false
        }
        
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let pred = NSPredicate(format: "SELF MATCHES %@", regex)
        
        return pred.evaluate(with: email)
    }
    
    func isValidPassword(password: String?) -> Bool {
        guard password != nil else {
            return false
        }
        
        if password!.count < 8 {
            return false
        } else {
            return true
        }
    }
}

