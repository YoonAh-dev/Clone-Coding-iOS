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
    var friendTableView: UITableView = UITableView()
    let friendHeaderLabel = UILabel()
    let mailViewButton = UIButton()
    
    var testData: [UserInfo] = UserInfo.friendInfo
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        friendTableView.dataSource = self
        
        setUp()
    }
    
    private func setUp(){
        view.backgroundColor = .white
        
        view.addSubview(friendHeaderLabel)
        friendHeaderLabel.text = "친구"
        friendHeaderLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        friendHeaderLabel.snp.makeConstraints{ make in
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).inset(20)
            make.top.equalToSuperview().inset(70)
        }
        
        view.addSubview(mailViewButton)
        mailViewButton.addTarget(self, action: #selector(didTapMailButton), for: .touchUpInside)
        mailViewButton.setTitle("✉️", for: .normal)
        mailViewButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        mailViewButton.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(70)
        }
        
        view.addSubview(friendTableView)
        friendTableView.register(FriendProfileTableViewCell.self, forCellReuseIdentifier: "FriendProfileTableViewCell")
        friendTableView.snp.makeConstraints{ make in
            make.leading.bottom.trailing.equalToSuperview()
            make.top.equalTo(friendHeaderLabel.snp.bottom).offset(45)
        }
    }
    
    @objc func didTapMailButton(){
        mailViewButton.setTitle("📩", for: .normal)
        mailViewButton.layer.shadowColor = UIColor.black.cgColor
        mailViewButton.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        mailViewButton.layer.shadowOpacity = 1.0
        mailViewButton.layer.shadowRadius = 0.0
        
        let vc = MailListViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.mailViewDismiss = { text in
            self.mailViewButton.setTitle("✉️", for: .normal)
            self.mailViewButton.layer.shadowColor = UIColor.white.cgColor
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
