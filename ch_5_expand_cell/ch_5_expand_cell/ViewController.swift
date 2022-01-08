//
//  ViewController.swift
//  ch_5_expand_cell
//
//  Created by formegusto on 2022/01/07.
//

import UIKit

class ExpandCell: UITableViewCell {
    @IBOutlet weak var descriptionLabel: UILabel!
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    struct ExpandDataModel {
        var description: String;
        var isExpand: Bool;
    }
    
    var dataModels = [ExpandDataModel]()
    
    @IBOutlet weak var expandTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        expandTableView.delegate = self
        expandTableView.dataSource = self
        
        let textArray = ["short text", "loooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong text","short text", "loooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong text","short text", "loooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong text","short text", "loooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong text","short text", "loooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong text"]
        
        for (_, value) in textArray.enumerated() {
            dataModels.append(ExpandDataModel(description: value, isExpand: false))
        }
    }


}

// UITableViewDataSource Setting
// dataSource : View에 연결될 데이터들에 관련한 정보를 연결
extension ViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModels.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "expandCell_ID", for: indexPath) as! ExpandCell
        
        cell.descriptionLabel.text = dataModels[indexPath.row].description
        
        if dataModels[indexPath.row].isExpand == true {
            // 0 이면, 텍스트 줄 수만큼 다 표현해라 라는 뜻
            cell.descriptionLabel.numberOfLines = 0
        } else {
            // 기본값으로 2줄!
            cell.descriptionLabel.numberOfLines = 1
        }
        
        cell.selectionStyle = .none
        
        return cell;
    }
}

// UITableViewDelegate Setting
extension ViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataModels[indexPath.row].isExpand = !dataModels[indexPath.row].isExpand
        
        // tableView 전체 reload
        // tableView.reloadData()
        // tableView.reloadRows(at: [indexPath], with: .none)
        
        // 튀는 현상이 있다는데, 나는 잘 모르겠음.
        // 아무튼 퍼포먼스를 올리는 방법들!
        // 1. heightForRowAt 에서 정확한 높이를 지정
        
        // 2. tableView.reloadData() : 어느정도는 해결
        
        
        // 3. 어느정도 해결
        // 이게 자동화로 붙는 옵션인데 값을 주면 어느정도 해결된다 함.
        // 이게 어느정도 값이 있으면 통통 튄다고 함.
        // 밑에가 기본값
        // tableView.estimatedSectionHeaderHeight = UITableView.automaticDimension
        // tableView.estimatedSectionHeaderHeight = 0
        // tableView.estimatedSectionFooterHeight = 0
        
        // 4. 애니메이션 효과를 없애는 확실히 해결
        UIView.setAnimationsEnabled(false)
        tableView.reloadRows(at: [indexPath], with: .none)
        UIView.setAnimationsEnabled(true)
        
        // 이를 설명하는 이유는, 똑같이 레이아웃이 튀는 현상이면
        // 다음과 같이 애니메이션이나, 어딘가의 크기 설정의 문제이기 때문에
        // 방향성을 잡을 수 있기 때문이다.
    }
}
