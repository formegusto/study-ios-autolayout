//
//  ViewController.swift
//  ch_12_chatapp
//
//  Created by formegusto on 2022/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.separatorStyle = .none
            
        }
    }
    var chatDatas = [String]()
    
    @IBOutlet weak var inputTextView: UITextView! {
        didSet {
            inputTextView.delegate = self
        }
    }
    @IBOutlet weak var inputTextViewHeight: NSLayoutConstraint!
    @IBOutlet weak var inputTextViewBottom: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 사용하려는 셀을 등록하는 것
        tableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "MyCell")
        tableView.register(UINib(nibName: "UrCell", bundle: nil), forCellReuseIdentifier: "YourCell")
        
        // 키보드 관련 옵저버 - 상태를 알려주는 패턴
        // 키보드가 올라올 때 호출될 Notification 등록
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notify: Notification) {
        // 관련된 정보를 가지고 올 수 있다.
        let notiInfo = notify.userInfo!
        // keyboardFrameBegin은 키보드가 올라오기 시작할때라 그 크기가 작다.
        let keyboardFrame = notiInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        let height = keyboardFrame.size.height - self.view.safeAreaInsets.bottom
        
        let animationDuration = notiInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        UIView.animate(withDuration: animationDuration) {
            self.inputTextViewBottom.constant = height * -1
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillHide(notify: Notification) {
        let notiInfo = notify.userInfo!
        let animationDuration = notiInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        UIView.animate(withDuration: animationDuration) {
            self.inputTextViewBottom.constant = 0
            self.view.layoutIfNeeded()
        }
        
    }
    
    @IBAction func sendString(_ sender: Any) {
        guard let hasText = inputTextView.text else {
            return
        }
        
        chatDatas.append(hasText)
        inputTextView.text = ""
        // 테이블 뷰가 전체 리로드 되는 개념이라,
        // 기기 성능이 떨어지면 좋지 않을 수 있다.
        // 그래서 insertRow를 사용해서, 해당 로우만 갱신되도록 한다.
        // tableView.reloadData()
        
        let lastIndexPath = IndexPath(row: chatDatas.count - 1, section: 0)
        tableView.insertRows(at: [lastIndexPath], with: .automatic)
        tableView.scrollToRow(at: lastIndexPath, at: .bottom, animated: true)
        
        self.inputTextViewHeight.constant = 40
    
    }

}

extension ViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        // ScrollView와 같은 개념으로,
        // 안쪽의 영역을 컨텐츠라고 한다.
        let contentHeight = textView.contentSize.height
        
        if contentHeight <= 40 {
            self.inputTextViewHeight.constant = 40
        } else if  contentHeight >= 100{
            self.inputTextViewHeight.constant = 100
        } else {
            self.inputTextViewHeight.constant = contentHeight
        }
        
    }
}

extension ViewController: UITableViewDelegate {
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row % 2 == 0{
            let myCell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyCell
            
            myCell.textView.text = chatDatas[indexPath.row]
            myCell.selectionStyle = .none
            
            return myCell
        } else {
            let urCell = tableView.dequeueReusableCell(withIdentifier: "YourCell") as! UrCell
            
            urCell.textView.text = chatDatas[indexPath.row]
            urCell.selectionStyle = .none
            
            return urCell
        }
    }
}
