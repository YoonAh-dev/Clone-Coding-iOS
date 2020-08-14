//
//  ViewController.swift
//  PA3
//
//  Created by SHIN YOON AH on 2020/07/24.
//  Copyright © 2020 SHIN YOON AH. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let loginButton = UIButton()
    let emojiLabel = UILabel()
    let welcomeLabel = UILabel()
    let describeLabel = UILabel()
    let completeLoginLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }
    
    private func setUp(){
        view.addSubview(emojiLabel)
        view.addSubview(welcomeLabel)
        view.addSubview(describeLabel)
        view.addSubview(loginButton)
        
        view.backgroundColor = .white
        
        emojiLabel.text = "🚀"
        emojiLabel.font = UIFont.systemFont(ofSize: 72)
        emojiLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(153)
        }
        
        welcomeLabel.text = "Welcome to Rocket"
        welcomeLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 30)
        welcomeLabel.textAlignment = .center
        welcomeLabel.textColor = UIColor(red: 217/255.0, green: 68/255.0, blue: 68/255.0, alpha: 1.0)
        welcomeLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(emojiLabel.snp.bottom).offset(37)
        }
        
        describeLabel.text = "반가워요\n어려웠던 iOS 쉽게 도와드릴게요"
        describeLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        describeLabel.textAlignment = .center
        describeLabel.numberOfLines = 2
        describeLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(welcomeLabel.snp.bottom).offset(25)
        }
        
        loginButton.addTarget(self, action: #selector(self.didClickLogin(sender:)), for: .touchUpInside)
        loginButton.setTitle("로그인", for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = UIColor(red: 204/255.0, green: 36/225.0, blue: 36/255.0, alpha: 1.0)
        loginButton.layer.cornerRadius = 20
        loginButton.layer.masksToBounds = true
        loginButton.snp.makeConstraints{ make in
            make.height.equalTo(42)
            make.width.equalTo(221)
            make.centerX.equalToSuperview()
            make.top.equalTo(describeLabel.snp.bottom).offset(57)
        }
    }
    
    @objc fileprivate func didClickLogin(sender: UIButton){
        self.labelsMoveAnimator(sender)
        
        let vc = LoginStatusViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.editCompleteLoginLabel = { text in
            self.labelsMoveBackAnimator()
            
            self.view.addSubview(self.completeLoginLabel)
            self.completeLoginLabel.text = text + "님 안녕하세요.🙋🏼‍♀️"
            self.completeLoginLabel.textAlignment = .center
            self.completeLoginLabel.numberOfLines = 0
            self.completeLoginLabel.font = UIFont(name:"AppleSDGothicNeo-Bold", size: 18)
            self.completeLoginLabel.snp.makeConstraints{ make in
                    make.centerX.equalToSuperview()
                    make.top.equalTo(self.welcomeLabel.snp.bottom).offset(25)
            }
        }
        present(vc, animated: true)
    }
    
    fileprivate func labelsMoveAnimator(_ viewToAnimate: UIView){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.emojiLabel.alpha = 0
            self.emojiLabel.transform = self.emojiLabel.transform.translatedBy(x: 0, y: -200)
            
            self.welcomeLabel.alpha = 0
            self.welcomeLabel.transform = self.welcomeLabel.transform.translatedBy(x: 0, y: -200)
            
            self.describeLabel.alpha = 0
            self.describeLabel.transform = self.describeLabel.transform.translatedBy(x: 0, y: -200)
            
            self.loginButton.alpha = 0
            self.loginButton.transform = self.loginButton.transform.translatedBy(x: 0, y: -200)
        }){ (_) in
            UIView.animate(withDuration: 50, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {})
        }
    }
    
    fileprivate func labelsMoveBackAnimator(){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            self.emojiLabel.alpha = 1
            self.emojiLabel.text = "🧑‍🚀"
            self.emojiLabel.transform = self.emojiLabel.transform.translatedBy(x: 0, y: 200)
            
            self.welcomeLabel.alpha = 1
            self.welcomeLabel.transform = self.welcomeLabel.transform.translatedBy(x: 0, y: 200)
            
            self.describeLabel.alpha = 1
            self.describeLabel.transform = self.describeLabel.transform.translatedBy(x: 0, y: 257)
        }){ (_) in
            UIView.animate(withDuration: 50, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {}, completion: nil)
        }
    }
}

