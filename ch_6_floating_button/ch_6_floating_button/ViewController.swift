//
//  ViewController.swift
//  ch_6_floating_button
//
//  Created by formegusto on 2022/01/09.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // 화면이 전환될 때 어떠한 설정을 할 수 있다.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPopup" {
            // 원하는 ViewController의 인스턴스를 가지고 온다.
            // DownCasting 이라 ! 붙여줘야 함
            let popupVC = segue.destination as! PopupViewController
            
            // 해당하는 View Controller를 투명하게 하는 설정
            // 인데 정확하게는 페이지가 넘어가는게 아니고 위로 띄어지는 개념 (Modal)
            popupVC.modalPresentationStyle = .overCurrentContext
        }
    }
}

