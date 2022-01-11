//
//  ViewController.swift
//  ch_8_custom_view
//
//  Created by formegusto on 2022/01/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cover: DiagonalCustomImageView!
    var isViewCover: Bool = true {
        didSet {
            if isViewCover {
                cover.innerHeight = 0
            } else {
                cover.innerHeight = 100
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func viewCover(_ sender: UIButton) {
        self.isViewCover = !self.isViewCover
    }
}

