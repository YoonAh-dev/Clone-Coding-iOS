//
//  MailTableViewCell.swift
//  PA3
//
//  Created by SHIN YOON AH on 2020/07/31.
//  Copyright © 2020 SHIN YOON AH. All rights reserved.
//

import UIKit
import SnapKit

class MailTableViewCell : UITableViewCell {
    private var profileImageButton = UIButton()
    private var bookMarkButton = UIButton()
    private let documentButton = UIButton()
    private let senderNameLabel = UILabel()
    private let messageContentLabel = UILabel()
    private let stackView = UIStackView()
    private let containerView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(){
        contentView.addSubview(profileImageButton)
        contentView.addSubview(senderNameLabel)
        contentView.addSubview(messageContentLabel)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(senderNameLabel)
        stackView.addArrangedSubview(messageContentLabel)
        stackView.addArrangedSubview(containerView)
        containerView.addSubview(documentButton)
        contentView.addSubview(bookMarkButton)
        
        profileImageButton.backgroundColor = UIColor.getRandomColor
        profileImageButton.layer.cornerRadius = 20
        profileImageButton.layer.masksToBounds = true
        profileImageButton.setTitleColor(.white, for: .normal)
        profileImageButton.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(10)
            make.size.equalTo(40)
        }
        
        senderNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        messageContentLabel.font = UIFont.boldSystemFont(ofSize: 14)
        messageContentLabel.numberOfLines = 2
        messageContentLabel.textAlignment = .left
        messageContentLabel.sizeToFit()
        messageContentLabel.textColor = UIColor.gray
        
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(10)
            make.width.equalTo(UIScreen.main.bounds.width/1.35)
            make.leading.equalTo(profileImageButton.snp.trailing)
            make.bottom.equalToSuperview().inset(20)
        }
        
        containerView.snp.makeConstraints{ make in
            make.leading.equalToSuperview().inset(10)
        }

        documentButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        documentButton.setTitleColor(.gray, for: .normal)
        documentButton.layer.borderColor = UIColor.lightGray.cgColor
        documentButton.layer.borderWidth = 1
        documentButton.layer.cornerRadius = 10
        documentButton.layer.masksToBounds = true
        documentButton.contentEdgeInsets = UIEdgeInsets(top: 1, left: 8, bottom: 1, right: 8)
        documentButton.titleLabel?.lineBreakMode = .byTruncatingTail
        documentButton.setContentHuggingPriority(.required, for: .horizontal)
        documentButton.snp.makeConstraints{ make in
            make.leading.equalToSuperview()
            make.width.lessThanOrEqualTo(UIScreen.main.bounds.width/2.5)
        }
        
        bookMarkButton.setImage(UIImage(named: "star"), for: .normal)
        bookMarkButton.alpha = 0.5
        bookMarkButton.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().inset(9)
            make.centerY.equalToSuperview()
            make.leading.equalTo(stackView.snp.trailing).offset(3).priority(.medium)
            make.size.equalTo(18)
        }
    }
    
    func configure(mailInfo: MailInfo){
        if let first = mailInfo.title.first{
            profileImageButton.setTitle(String(first) , for: .normal)
        } else {
            profileImageButton.setTitle("", for: .normal)
        }
        
        senderNameLabel.text = mailInfo.title
        if mailInfo.isRead == true {
            senderNameLabel.textColor = UIColor.gray
            bookMarkButton.imageView?.alpha = 0.5
        }
        
        messageContentLabel.text = mailInfo.content
        
        if mailInfo.documents == nil {
            containerView.isHidden = true
        } else {
            documentButton.setTitle(mailInfo.documents, for: .normal)
            containerView.isHidden = false
        }
    }
}
