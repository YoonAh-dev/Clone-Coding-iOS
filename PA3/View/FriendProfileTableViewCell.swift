//
//  FriendProfileTableViewCell.swift
//  PA3
//
//  Created by SHIN YOON AH on 2020/07/26.
//  Copyright © 2020 SHIN YOON AH. All rights reserved.
//

import UIKit
import SnapKit

class FriendProfileTableViewCell : UITableViewCell {
    private var profileImageButton = UIButton()
    private var musicButton = UIButton()
    private let userNameLabel = UILabel()
    private let statusMessageLabel = UILabel()
    private let stackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp(){
        contentView.addSubview(profileImageButton)
        profileImageButton.layer.cornerRadius = 15
        profileImageButton.layer.masksToBounds = true
        profileImageButton.snp.makeConstraints{ make in
            make.leading.top.bottom.equalToSuperview().inset(10)
            make.size.equalTo(40)
        }
        
        contentView.addSubview(userNameLabel)
        userNameLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        
        contentView.addSubview(statusMessageLabel)
        statusMessageLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        statusMessageLabel.textColor = UIColor.black.withAlphaComponent(0.5)
        
        contentView.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.snp.makeConstraints{ make in
            make.leading.equalTo(profileImageButton.snp.trailing).offset(10)
            make.centerY.equalToSuperview()
            make.width.lessThanOrEqualTo(UIScreen.main.bounds.width/2)
        }
        
        stackView.addArrangedSubview(userNameLabel)
        stackView.addArrangedSubview(statusMessageLabel)
        
        contentView.addSubview(musicButton)
        musicButton.layer.cornerRadius = 10
        musicButton.layer.masksToBounds = true
        musicButton.backgroundColor = .white
        musicButton.setTitleColor(UIColor.black.withAlphaComponent(0.5), for: .normal)
        musicButton.layer.borderColor = UIColor.green.cgColor
        musicButton.layer.borderWidth = 1
        musicButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 13)
        musicButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
        musicButton.setContentHuggingPriority(.required, for: .horizontal)
        musicButton.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
            make.leading.equalTo(stackView.snp.trailing).offset(10).priority(.medium)
            make.width.lessThanOrEqualTo(UIScreen.main.bounds.width/3)
        }
    }
    
    func configure(userInfo: UserInfo){
        profileImageButton.setBackgroundImage(userInfo.profileImage, for: .normal)
        
        userNameLabel.text = userInfo.userName
        
        statusMessageLabel.text = userInfo.statusMessage
        
        if userInfo.profileMusic == nil {
            musicButton.isHidden = true
        } else {
            musicButton.setTitle(userInfo.profileMusic, for: .normal)
            musicButton.isHidden = false
        }
    }
}
