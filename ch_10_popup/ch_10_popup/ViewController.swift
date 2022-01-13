import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showPopup(_ sender: Any) {
        // 1. popupViewController
        // - 이 때, name은 Storyboard 파일명
        let storyBoard = UIStoryboard.init(name: "PopupViewController", bundle: nil)
        
        // - 이 때, withIdentifier 는 StoryboardID
        let popupVC = storyBoard.instantiateViewController(withIdentifier: "popupVC_ID") as! PopupViewController
        
        // completion 은 navigation 작업이 끝났을 때,
        // animated 는 iOS에서 기본적으로 지원해주는 밑에서 위로 올라오는 액션
        // 내 XCode는 버전이 높아서 fullScreen 팝업이 되려면 아래와 같이 해줘야함.
        // 이었는데 이처럼 하면 됨
        // 이렇게 해야 전환이 아니고, 위로 쌓이는 느낌으로 navigation이 전환됨
        popupVC.modalPresentationStyle = .overCurrentContext
        self.present(popupVC, animated: false, completion: nil)
    }
    
}

