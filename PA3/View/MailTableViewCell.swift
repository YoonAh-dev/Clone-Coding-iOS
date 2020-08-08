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
    private let senderNameLabel = UILabel()
    private let messageContentsLabel = UILabel()
    private let documentButton = UIButton()
    private let stackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(){
        contentView.addSubview(profileImageButton)
        profileImageButton.backgroundColor = UIColor.getRandomColor
        profileImageButton.layer.cornerRadius = 20
        profileImageButton.layer.masksToBounds = true
        profileImageButton.setTitleColor(.white, for: .normal)
        profileImageButton.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(5)
            make.leading.equalToSuperview().inset(10)
            make.size.equalTo(40)
        }
        
        contentView.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(5)
            make.width.equalTo(UIScreen.main.bounds.width/1.35)
            make.leading.equalTo(profileImageButton.snp.trailing).offset(15)
        }
        
        contentView.addSubview(senderNameLabel)
        senderNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        contentView.addSubview(messageContentsLabel)
        messageContentsLabel.font = UIFont.boldSystemFont(ofSize: 14)
        messageContentsLabel.numberOfLines = 2
        messageContentsLabel.textAlignment = .left
        messageContentsLabel.sizeToFit()
        messageContentsLabel.textColor = UIColor.gray
        
        stackView.addArrangedSubview(senderNameLabel)
        stackView.addArrangedSubview(messageContentsLabel)
        
        contentView.addSubview(documentButton)
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
            make.width.lessThanOrEqualTo(UIScreen.main.bounds.width/2.5)
        }
        
        contentView.addSubview(bookMarkButton)
        bookMarkButton.setImage(UIImage(named: "star"), for: .normal)
        bookMarkButton.alpha = 0.5
        bookMarkButton.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().inset(9)
            make.centerY.equalToSuperview()
            make.leading.equalTo(stackView.snp.trailing).offset(3).priority(.medium)
            make.size.equalTo(18)
        }
        
        let docStackView = UIStackView()
        contentView.addSubview(docStackView)
        docStackView.axis = .vertical
        docStackView.spacing = 5
        docStackView.snp.makeConstraints{ make in
            make.top.equalTo(stackView.snp.bottom).offset(7)
            make.width.equalTo(UIScreen.main.bounds.width/4).priority(.medium)
            make.leading.equalToSuperview().inset(66)
            make.bottom.equalToSuperview().inset(10)
        }
        
        docStackView.addArrangedSubview(documentButton)
    }
    
    func configure(mailInfo: MailInfo){
        if let first = mailInfo.title.first{
            profileImageButton.setTitle(String(first) , for: .normal)
        }
        else {
            profileImageButton.setTitle("", for: .normal)
        }
        
        if mailInfo.isRead == true {
            senderNameLabel.textColor = UIColor.gray
            bookMarkButton.imageView?.alpha = 0.5
        }
        senderNameLabel.text = mailInfo.title
        
        messageContentsLabel.text = mailInfo.content
        
        if mailInfo.documents == nil {
            documentButton.isHidden = true
        } else {
            documentButton.setTitle(mailInfo.documents, for: .normal)
            // 재사용되기 때문에 꼭 isHidden 풀어주기
            documentButton.isHidden = false
        }
    }
}
