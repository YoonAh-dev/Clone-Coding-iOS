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
    let emogiLabel = UILabel()
    let welcomeLabel = UILabel()
    let describeLabel = UILabel()
    let vc_LoginButton = UIButton()
    let completeLoginLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUp()
    }
    
    func setUp(){
        view.backgroundColor = .white
        
        view.addSubview(emogiLabel)
        emogiLabel.text = "🚀"
        emogiLabel.font = UIFont.systemFont(ofSize: 72)
        emogiLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(153)
        }
        
        view.addSubview(welcomeLabel)
        welcomeLabel.text = "Welcome to Rocket"
        welcomeLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 30)
        welcomeLabel.textAlignment = .center
        welcomeLabel.textColor = UIColor(red: 217/255.0, green: 68/255.0, blue: 68/255.0, alpha: 1.0)
        welcomeLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(emogiLabel.snp.bottom).offset(37)
        }
        
        view.addSubview(describeLabel)
        describeLabel.text = "반가워요\n어려웠던 iOS 쉽게 도와드릴게요"
        describeLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        describeLabel.textAlignment = .center
        describeLabel.numberOfLines = 2
        describeLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(welcomeLabel.snp.bottom).offset(25)
        }
        
        view.addSubview(vc_LoginButton)
        vc_LoginButton.addTarget(self, action: #selector(self.didClickLogin(sender:)), for: .touchUpInside)
        vc_LoginButton.setTitle("로그인", for: .normal)
        vc_LoginButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        vc_LoginButton.setTitleColor(.white, for: .normal)
        vc_LoginButton.backgroundColor = UIColor(red: 204/255.0, green: 36/225.0, blue: 36/255.0, alpha: 1.0)
        vc_LoginButton.layer.cornerRadius = 20
        vc_LoginButton.layer.masksToBounds = true
        vc_LoginButton.snp.makeConstraints{ make in
            make.height.equalTo(42)
            make.width.equalTo(221)
            make.centerX.equalToSuperview()
            make.top.equalTo(describeLabel.snp.bottom).offset(57)
        }
    }
    
    @objc fileprivate func didClickLogin(sender: UIButton){
        self.animateLabelView(sender)
        let vc = LoginStatusViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.saveIDPW = {text in
            self.animateLabelBackView()
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
    
    fileprivate func animateLabelView(_ viewToAnimate: UIView){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.emogiLabel.alpha = 0
            self.emogiLabel.transform = self.emogiLabel.transform.translatedBy(x: 0, y: -200)
            
            self.welcomeLabel.alpha = 0
            self.welcomeLabel.transform = self.welcomeLabel.transform.translatedBy(x: 0, y: -200)
            
            self.describeLabel.alpha = 0
            self.describeLabel.transform = self.describeLabel.transform.translatedBy(x: 0, y: -200)
            
            self.vc_LoginButton.alpha = 0
            self.vc_LoginButton.transform = self.vc_LoginButton.transform.translatedBy(x: 0, y: -200)
        }){ (_) in
            
            UIView.animate(withDuration: 50, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {})
        }
    }
    
    fileprivate func animateLabelBackView(){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            self.emogiLabel.alpha = 1
            self.emogiLabel.text = "🧑‍🚀"
            self.emogiLabel.transform = self.emogiLabel.transform.translatedBy(x: 0, y: 200)
            
            self.welcomeLabel.alpha = 1
            self.welcomeLabel.transform = self.welcomeLabel.transform.translatedBy(x: 0, y: 200)
            
            self.describeLabel.alpha = 1
            self.describeLabel.transform = self.describeLabel.transform.translatedBy(x: 0, y: 257)
        }){ (_) in
            UIView.animate(withDuration: 50, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {}, completion: nil)
        }
    }

}

