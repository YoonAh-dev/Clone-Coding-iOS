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
    var mailTableView: UITableView = UITableView()
    let friendListButton = UIButton()
    let mailHeaderLabel = UILabel()
    
    var mailViewDismiss: ((String) -> Void)?
    
    var testData: [MailInfo] = MailInfo.mailInfo
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mailTableView.dataSource = self
        
        setUp()
    }
    
    private func setUp(){
        view.addSubview(mailHeaderLabel)
        view.addSubview(friendListButton)
        view.addSubview(mailTableView)
        
        view.backgroundColor = .white
        
        mailHeaderLabel.text = "메일함"
        mailHeaderLabel.font = UIFont.defaultHeaderBold
        mailHeaderLabel.snp.makeConstraints{ make in
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).inset(20)
            make.top.equalToSuperview().inset(70)
        }
        
        friendListButton.addTarget(self, action: #selector(didTapFriendButton), for: .touchUpInside)
        friendListButton.setTitle("👤", for: .normal)
        friendListButton.titleLabel?.font = UIFont.defaultHeaderFont
        friendListButton.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(70)
        }
        
        mailTableView.register(MailTableViewCell.self, forCellReuseIdentifier: "MailTableViewCell")
        mailTableView.separatorColor = .clear
        mailTableView.snp.makeConstraints{ make in
            make.leading.bottom.trailing.equalToSuperview()
            make.top.equalTo(mailHeaderLabel.snp.bottom).offset(45)
        }
    }
    
    @objc func didTapFriendButton(){
        self.mailViewDismiss?("")
        
        dismiss(animated: true, completion: nil)
    }
}

extension MailListViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        testData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MailTableViewCell") as! MailTableViewCell
        cell.configure(mailInfo: testData[indexPath.row])
        
        return cell
    }
}
