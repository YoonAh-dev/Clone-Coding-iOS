//
//  ProfileViewController.swift
//  PA3
//
//  Created by SHIN YOON AH on 2020/08/13.
//  Copyright © 2020 SHIN YOON AH. All rights reserved.
//

import UIKit
import SnapKit

class ProfileViewController : UIViewController {
    var backgroundImageView = UIImageView()
    var profileImageButton = UIButton()
    var disableImageButton = UIButton(type: .close)
    var musicButton = UIButton()
    var userNameLabel = UILabel()
    var userStatusLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }
    
    private func setUp(){
        view.addSubview(backgroundImageView)
        view.addSubview(musicButton)
        view.addSubview(userNameLabel)
        view.addSubview(userStatusLabel)
        view.addSubview(profileImageButton)
        view.addSubview(disableImageButton)
        
        backgroundImageView.backgroundColor = UIColor.getRandomColor
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        
        musicButton.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        musicButton.setTitleColor(.white, for: .normal)
        musicButton.titleLabel?.font = UIFont.defaultLargeFont
        musicButton.titleLabel?.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        musicButton.titleLabel?.layer.shadowColor = UIColor.black.withAlphaComponent(0.7).cgColor
        musicButton.titleLabel?.layer.shadowOpacity = 1.0
        musicButton.titleLabel?.layer.shadowRadius = 1.0
        musicButton.layer.borderWidth = 1
        musicButton.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        musicButton.layer.cornerRadius = 10
        musicButton.layer.masksToBounds = true
        musicButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
        musicButton.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(90)
            make.width.lessThanOrEqualTo(UIScreen.main.bounds.width/3)
        }
        
        userNameLabel.font = UIFont.defaultXLargeFont
        userNameLabel.textColor = .white
        userNameLabel.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        userNameLabel.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        userNameLabel.layer.shadowOpacity = 0.5
        userNameLabel.layer.shadowRadius = 0.5
        userNameLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(150)
            make.width.lessThanOrEqualTo(UIScreen.main.bounds.width/3)
        }
        
        userStatusLabel.font = UIFont.defaultNormalFont
        userStatusLabel.textAlignment = .center
        userStatusLabel.textColor = .white
        userStatusLabel.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        userStatusLabel.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        userStatusLabel.layer.shadowOpacity = 0.5
        userStatusLabel.layer.shadowRadius = 0.5
        userStatusLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(userNameLabel.snp.bottom).offset(10)
            make.width.lessThanOrEqualTo(UIScreen.main.bounds.width/2)
        }
        
        profileImageButton.layer.cornerRadius = 35
        profileImageButton.alpha = 0.9
        profileImageButton.layer.masksToBounds = true
        profileImageButton.addTarget(self, action: #selector(didTapProfileImage), for: .touchUpInside)
        profileImageButton.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(userNameLabel.snp.top).offset(-20)
            make.size.equalTo(100)
        }
        
        disableImageButton.addTarget(self, action: #selector(didTapxIcon), for: .touchUpInside)
        disableImageButton.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.size.equalTo(30)
            make.bottom.equalToSuperview().inset(25)
        }
    }
    
    func setProfile(userInfo: UserInfo){
        profileImageButton.setBackgroundImage(userInfo.profileImage, for: .normal)
        
        if userInfo.profileMusic == nil {
            musicButton.isHidden = true
        } else {
            musicButton.isHidden = false
            musicButton.setTitle(userInfo.profileMusic, for: .normal)
        }
        
        userNameLabel.text = userInfo.userName
        
        userStatusLabel.text = userInfo.statusMessage
    }
    
    @objc func didTapProfileImage() {
        let vc = EditStatusViewController()
        vc.modalPresentationStyle = .overCurrentContext
        vc.editNameLable = {text in
            self.userStatusLabel.text = text
        }
        present(vc, animated: true, completion: nil)
    }
    
    @objc func didTapxIcon() {
        if profileImageButton.isHidden == true{
            profileImageButton.isHidden = false
        } else{
            profileImageButton.isHidden = true
        }
    }
}
