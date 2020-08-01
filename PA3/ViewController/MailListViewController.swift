//
//  MailListViewController.swift
//  PA3
//
//  Created by SHIN YOON AH on 2020/07/31.
//  Copyright © 2020 SHIN YOON AH. All rights reserved.
//

import UIKit
import SnapKit

class MailListViewController : UIViewController {
    var mailPageDown: ((String) -> Void)?
    var tableView: UITableView = UITableView()
    var testData: [MailInfo] = MailInfo.mailInfo
    let mailLabel = UILabel()
    let friendButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        setUp()
    }
    
    func setUp(){
        view.backgroundColor = .white
        
        view.addSubview(mailLabel)
        mailLabel.text = "메일함"
        mailLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        mailLabel.snp.makeConstraints{ make in
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).inset(20)
            make.top.equalToSuperview().inset(70)
        }
        
        view.addSubview(tableView)
        tableView.register(MailTableViewCell.self, forCellReuseIdentifier: "MailTableViewCell")
        tableView.separatorColor = .clear
        tableView.snp.makeConstraints{ make in
            make.leading.bottom.trailing.equalToSuperview()
            make.top.equalTo(mailLabel.snp.bottom).offset(45)
        }
        
        
        
        view.addSubview(friendButton)
        friendButton.addTarget(self, action: #selector(didClickFriendButton), for: .touchUpInside)
        friendButton.setTitle("👤", for: .normal)
        friendButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        friendButton.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(70)
        }
    }
    
    @objc func didClickFriendButton(){
        self.mailPageDown?("")
        dismiss(animated: true, completion: nil)
    }
}

extension MailListViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        testData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // tableView에 re
        let cell = tableView.dequeueReusableCell(withIdentifier: "MailTableViewCell") as! MailTableViewCell
        cell.configure(mailInfo: testData[indexPath.row])
        return cell
    }
}
