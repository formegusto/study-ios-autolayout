//
//  ViewController.swift
//  ch_2_calculator
//
//  Created by formegusto on 2022/01/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var btn10: UIButton!
    @IBOutlet weak var btn11: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayLabel.text = ""
        // layer 라는 개념
        // cornerRadius 가장 자리 라운딩 처리
        displayLabel.layer.cornerRadius = 24
        // 라벨 오브젝트는 기본적으로 cliped 가 안걸려 있어서 해당 설정을 해줘야한다.
        // clip은 오브젝트를 자른다는 뜻이다.
        displayLabel.layer.masksToBounds = true
        // === displayLabel.clipsToBounds = true
        
        // 해당방법은 고정값이기 때문에, 유동적으로 변하는 autolayout
        // 에서, 완전한 원을 만들지 못한다.
        // btn1.layer.cornerRadius = 50
        
        // 근데 또 안될거임. 그 이유는 viewDidLoad는
        // 화면에 무언가를 그리기 전에 실행되기 때문에, (viewController src를 실행시킬 수 있을 때, 실행된다)
        // 정확하게 btn1의 크기를 모름
        // 즉, auto-layout에 계산된 값이 안나온거임
        // 그래서 밑에 viewDidAppear을 이용해야함
        // btn1.layer.cornerRadius = btn1.bounds.width / 2
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // view가 화면에 다 그려지고 실행되는 함수
        btn1.layer.cornerRadius = btn1.bounds.width / 2
        btn2.layer.cornerRadius = btn2.bounds.width / 2
        btn3.layer.cornerRadius = btn3.bounds.width / 2
        btn4.layer.cornerRadius = btn4.bounds.width / 2
        btn5.layer.cornerRadius = btn5.bounds.width / 2
        btn6.layer.cornerRadius = btn6.bounds.width / 2
        btn7.layer.cornerRadius = btn7.bounds.width / 2
        btn8.layer.cornerRadius = btn8.bounds.width / 2
        btn9.layer.cornerRadius = btn9.bounds.width / 2
        btn10.layer.cornerRadius = btn10.bounds.height / 2
        btn11.layer.cornerRadius = btn11.bounds.width / 2
        // 한가지 조건이 더 필요함, 모든 화면에서 버튼이 정사각형으로 보여야함
        // Aspect Ratio
    }
    
    @IBAction func btnAction(_ sender: UIButton) {
        if let hasLabel = sender.titleLabel {
            displayLabel.text! += hasLabel.text!
        }
    }
}

