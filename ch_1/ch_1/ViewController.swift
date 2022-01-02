//
//  ViewController.swift
//  ch_1
//
//  Created by formegusto on 2021/12/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myButton = UIButton.init(type: .system)
        myButton.setTitle("MyButton", for: .normal)
        
        self.view.addSubview(myButton)
        
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        myButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        myButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -100).isActive = true
        
        
        // Label
        let myLabel = UILabel.init()
        myLabel.text = "Hello, Swift :)"
        
        self.view.addSubview(myLabel)
        
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        myLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
    }


}

