//
//  LoginStatusViewController.swift
//  PA3
//
//  Created by SHIN YOON AH on 2020/07/24.
//  Copyright © 2020 SHIN YOON AH. All rights reserved.
//

import UIKit
import SnapKit

class LoginStatusViewController : UIViewController, UITextFieldDelegate{
    let loginButton = UIButton()
    let kakaoLoginButton = UIButton()
    let facebookLoginButton = UIButton()
    let instagramLoginButton = UIButton()
    let loginLabel = UILabel()
    var idTextfield = UITextField()
    var pwTextfield = UITextField()
    let stackView = UIStackView()
    
    var editCompleteLoginLabel: ((String) -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        idTextfield.delegate = self
        pwTextfield.delegate = self
        
        setUp()
        
        setUpStackView()
    }
    
    private func setUp(){
        view.addSubview(loginLabel)
        view.addSubview(idTextfield)
        view.addSubview(pwTextfield)
        view.addSubview(loginButton)
        
        view.backgroundColor = .white
                
        loginLabel.text = "로그인"
        loginLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 36)
        loginLabel.textColor = UIColor(red: 224/255.0, green: 32/255.0, blue: 32/255.0, alpha: 1.0)
        loginLabel.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(34)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).inset(20)
        }
        
        idTextfield.placeholder = "아이디"
        idTextfield.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 18)
        idTextfield.autocorrectionType = .no
        idTextfield.autocapitalizationType = .none
        underlined(idTextfield)
        idTextfield.snp.makeConstraints{ make in
            make.top.equalTo(loginLabel.snp.bottom).offset(67)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).inset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).inset(20)
        }
        
        pwTextfield.placeholder = "비밀번호"
        pwTextfield.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 18)
        pwTextfield.isSecureTextEntry = true
        pwTextfield.autocorrectionType = .no
        underlined(pwTextfield)
        pwTextfield.snp.makeConstraints{ make in
            make.top.equalTo(idTextfield.snp.bottom).offset(17)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).inset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).inset(20)
        }
        
        loginButton.addTarget(self, action: #selector(didClickLogin), for: .touchUpInside)
        loginButton.setTitle("로그인", for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = UIColor(red: 204/255.0, green: 36/225.0, blue: 36/255.0, alpha: 1.0)
        loginButton.layer.cornerRadius = 20
        loginButton.layer.masksToBounds = true
        loginButton.snp.makeConstraints{ make in
            make.height.equalTo(50)
            make.width.equalTo(200)
            make.centerX.equalToSuperview()
            make.top.equalTo(pwTextfield.snp.bottom).offset(202)
        }
    }
    
    private func setUpStackView(){
        view.addSubview(stackView)
        stackView.addArrangedSubview(kakaoLoginButton)
        stackView.addArrangedSubview(facebookLoginButton)
        stackView.addArrangedSubview(instagramLoginButton)
        
        kakaoLoginButton.setTitle("카카오톡으로 로그인", for: .normal)
        kakaoLoginButton.addTarget(self, action: #selector(didClickKakaoLogin), for: .touchUpInside)
        kakaoLoginButton.backgroundColor = UIColor.init(red: 255/255, green: 193/255, blue: 37/255, alpha: 1)
        kakaoLoginButton.setTitleColor(.white, for: .normal)
        kakaoLoginButton.titleLabel?.font = UIFont.init(name: "AppleSDGothicNeo-Bold", size: 18)
        kakaoLoginButton.layer.cornerRadius = 10
        kakaoLoginButton.layer.masksToBounds = true
        
        facebookLoginButton.setTitle("Facebook으로 로그인", for: .normal)
        facebookLoginButton.addTarget(self, action: #selector(didClickFacebookLogin), for: .touchUpInside)
        facebookLoginButton.backgroundColor = UIColor.init(red: 36/255, green: 104/255, blue: 204/255, alpha: 1)
        facebookLoginButton.titleLabel?.font = UIFont.init(name: "AppleSDGothicNeo-Bold", size: 18)
        facebookLoginButton.layer.cornerRadius = 10
        facebookLoginButton.layer.masksToBounds = true
        
        instagramLoginButton.setTitle("Instagram으로 로그인", for: .normal)
        instagramLoginButton.addTarget(self, action: #selector(didClickInstaLogin), for: .touchUpInside)
        instagramLoginButton.backgroundColor = UIColor.init(red: 217/255, green: 87/255, blue: 123/255, alpha: 1)
        instagramLoginButton.titleLabel?.font = UIFont.init(name: "AppleSDGothicNeo-Bold", size: 18)
        instagramLoginButton.layer.cornerRadius = 10
        instagramLoginButton.layer.masksToBounds = true
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 3.0
        stackView.snp.makeConstraints{ make in
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).inset(60)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-200)
        }
    }
    
    func underlined(_ tf: UITextField){
        tf.backgroundColor = .white
        tf.layer.shadowColor = UIColor.lightGray.cgColor
        tf.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        tf.layer.shadowOpacity = 1.0
        tf.layer.shadowRadius = 0.0
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == idTextfield {
            pwTextfield.becomeFirstResponder()
        } else {
            pwTextfield.resignFirstResponder()
        }
        
        return true
    }
    
    func loginButtonClicked(sender:UIButton){
        sender.showsTouchWhenHighlighted = true
    }
    
    @objc func didClickLogin(sender: UIButton){
        loginButtonClicked(sender: sender)
        
        let saveIDMessage = self.idTextfield.text ?? ""
        self.editCompleteLoginLabel?(saveIDMessage)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func didClickKakaoLogin(sender: UIButton){
        self.animateView(sender)
    }
    
    @objc func didClickFacebookLogin(sender: UIButton){
        self.animateView(sender)
    }
    
    @objc func didClickInstaLogin(sender: UIButton){
        self.animateView(sender)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    fileprivate func animateView(_ viewToAnimate: UIView){
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        }) { (_) in
            UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
                viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
        }
    }
}
