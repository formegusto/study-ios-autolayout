//
//  PopupViewController.swift
//  ch_6_floating_button
//
//  Created by formegusto on 2022/01/09.
//

import UIKit

class PopupViewController: UIViewController {

    @IBOutlet weak var foodOneCenterY: NSLayoutConstraint!
    @IBOutlet weak var foodTwoCenterY: NSLayoutConstraint!
    @IBOutlet weak var foodThreeCenterY: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 화면에 그려지기 전에는 0으로 숨긴다.
        foodOneCenterY.constant = 0
        foodTwoCenterY.constant = 0
        foodThreeCenterY.constant = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 눈에 보이는 시점 ( 다 그려지는 시점 )
        // 이제 올린다!
        
        // animate
        // 인자 중에 animate를 closer 형태로 넣은 것이다.
        // 일반적으로 linear 속도라고 생각하면 된다.
        /*
        UIView.animate(withDuration: 1) {
            // 이 때 화면이 갱신하게 할 수 있어서, 꼭 넣어줘야 함.
            self.foodOneCenterY.constant = 240
            self.foodTwoCenterY.constant = 160
            self.foodThreeCenterY.constant = 80
            
            self.view.layoutIfNeeded()
        }
         */
        
        // damping
        // damping 값이 0에 가까울 수록 많이 흔들린다.
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0, options: .curveEaseOut) {
            self.foodOneCenterY.constant = 240
            self.foodTwoCenterY.constant = 160
            self.foodThreeCenterY.constant = 80
            
            self.view.layoutIfNeeded()
        } completion: { (completion) in
            // 애니메이션이 끝나는 시점에 사용되는 클로저
        }

    }

    
    @IBAction func dismissPopup(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear) {
            self.foodOneCenterY.constant = 0
            self.foodTwoCenterY.constant = 0
            self.foodThreeCenterY.constant = 0
            
            self.view.layoutIfNeeded()
        } completion: { (completion) in
            // 애니메이션이 끝나는 시점에 사용되는 클로저
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    @IBAction func foodSelected(_ sender: UIButton) {
        let hasTag = sender.tag
        var foodName: String?
        
        switch hasTag {
        case 1:
            foodName = "FoodOne"
        case 2:
            foodName = "FoodTwo"
        case 3:
            foodName = "FoodThree"
        default:
            break
        }
        
        print((foodName ?? "") + " Selected :)")
            
    }
    
}
