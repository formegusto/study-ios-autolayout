import UIKit

class PopupViewController: UIViewController {

    @IBOutlet weak var bgView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tabView))
        
//        bgView.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func doneAction(_ sender: Any) {
        print("done press")
    }
    
    @objc func tabView(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func closePopup(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
}
