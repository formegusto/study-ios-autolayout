//
//  ViewController.swift
//  ch_7_graph
//
//  Created by formegusto on 2022/01/11.
//

import UIKit

// 해당 클래스를 확장시켜준다.
extension NSLayoutConstraint {
    func changeMultiplier(value: CGFloat) -> NSLayoutConstraint {
        // constraint는 추가되는 개념이다. 바꿔치기 하는 개념이 아니기 때문에
        // 모든 constraint를 비활성화 시켜준다음에 적용하도록 한다.
        // 해당 메서드가 constraint를 비활성화 시켜준다.
        NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint.init(item: self.firstItem, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: value, constant: self.constant)
        
        newConstraint.priority = self.priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        // 밑에는 에러가 발생한다.
        // self = newConstraint
        
        return newConstraint
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var bar1Height: NSLayoutConstraint!
    @IBOutlet weak var bar2Height: NSLayoutConstraint!
    @IBOutlet weak var bar3Height: NSLayoutConstraint!
    @IBOutlet weak var bar4Height: NSLayoutConstraint!
    @IBOutlet weak var bar5Height: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        bar1Height.constant = 500
        bar1Height.priority = UILayoutPriority(rawValue: 700)
        
        // Error! Multiplier 는 get-only properties 입니다.
        bar1Height.multiplier = 500
         */
        
    }

    @IBAction func styleOne(_ sender: Any) {
        bar5Height = bar5Height.changeMultiplier(value: 0.9)
        bar4Height = bar4Height.changeMultiplier(value: 0.8)
        bar3Height = bar3Height.changeMultiplier(value: 0.7)
        bar2Height = bar2Height.changeMultiplier(value: 0.6)
        bar1Height = bar1Height.changeMultiplier(value: 0.5)
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func styleTwo(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            self.bar5Height = self.bar5Height.changeMultiplier(value: 0.5)
            self.bar4Height = self.bar4Height.changeMultiplier(value: 0.6)
            self.bar3Height = self.bar3Height.changeMultiplier(value: 0.7)
            self.bar2Height = self.bar2Height.changeMultiplier(value: 0.8)
            self.bar1Height = self.bar1Height.changeMultiplier(value: 0.9)
            
            self.view.layoutIfNeeded()
        }
    }
}

