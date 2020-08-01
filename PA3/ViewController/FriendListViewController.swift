//
//  FriendListViewController.swift
//  PA3
//
//  Created by SHIN YOON AH on 2020/07/26.
//  Copyright © 2020 SHIN YOON AH. All rights reserved.
//

import UIKit
import SnapKit

class FriendListViewController : UIViewController {
    var tableView: UITableView = UITableView()
    var testData: [UserInfo] = UserInfo.friendInfo
    let friendLabel = UILabel()
    let mailButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        setUp()
    }
    
    private func setUp(){
        view.backgroundColor = .white
        
        view.addSubview(friendLabel)
        friendLabel.text = "친구"
        friendLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        friendLabel.snp.makeConstraints{ make in
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).inset(20)
            make.top.equalToSuperview().inset(70)
        }
        
        view.addSubview(mailButton)
        mailButton.addTarget(self, action: #selector(didClickMailButton), for: .touchUpInside)
        mailButton.setTitle("✉️", for: .normal)
        mailButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        mailButton.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(70)
        }
        
        view.addSubview(tableView)
        tableView.register(FriendProfileTableViewCell.self, forCellReuseIdentifier: "FriendProfileTableViewCell")
        tableView.snp.makeConstraints{ make in
            make.leading.bottom.trailing.equalToSuperview()
            make.top.equalTo(friendLabel.snp.bottom).offset(45)
        }
    }
    
    @objc func didClickMailButton(){
        mailButton.setTitle("📩", for: .normal)
        mailButton.layer.shadowColor = UIColor.black.cgColor
        mailButton.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        mailButton.layer.shadowOpacity = 1.0
        mailButton.layer.shadowRadius = 0.0
        
        let vc = MailListViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.mailPageDown = { text in
            self.mailButton.setTitle("✉️", for: .normal)
            self.mailButton.layer.shadowColor = UIColor.white.cgColor
        }
        present(vc, animated: true, completion: nil)
    }
}



extension FriendListViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        testData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // tableView에 re
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendProfileTableViewCell") as! FriendProfileTableViewCell
        cell.configure(userInfo: testData[indexPath.row])
        return cell
    }
}
