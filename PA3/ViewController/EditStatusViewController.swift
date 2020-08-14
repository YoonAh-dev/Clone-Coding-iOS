//
//  EditStatusViewController.swift
//  PA3
//
//  Created by SHIN YOON AH on 2020/08/13.
//  Copyright © 2020 SHIN YOON AH. All rights reserved.
//

import UIKit
import SnapKit

class EditStatusViewController : UIViewController, UITextFieldDelegate{
    private var okButton = UIButton()
    private var cancelButton = UIButton()
    private var textFieldCountLabel = UILabel()
    private var nameLabel = UILabel()
    private var userTextField = UITextField()
    
    var editNameLable: ((String) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userTextField.delegate = self
        
        setUp()
    }
    
    private func setUp() {
        view.addSubview(userTextField)
        view.addSubview(textFieldCountLabel)
        view.addSubview(nameLabel)
        view.addSubview(okButton)
        view.addSubview(cancelButton)
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        userTextField.becomeFirstResponder()
        userTextField.tintColor = .yellow
        userTextField.backgroundColor = UIColor.white.withAlphaComponent(0.1)
        userTextField.textAlignment = .center
        userTextField.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(200)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        textFieldCountLabel.text = "0 / 20"
        textFieldCountLabel.textColor = .white
        textFieldCountLabel.alpha = 0.5
        textFieldCountLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(userTextField.snp.bottom).offset(20)
        }
        
        nameLabel.text = "이름"
        nameLabel.font = UIFont.defaultXXLargeBold
        nameLabel.textColor = .white
        nameLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(20)
        }
        
        okButton.setTitle("확인", for: .normal)
        okButton.setTitleColor(.white, for: .normal)
        okButton.addTarget(self, action: #selector(didOkButton), for: .touchUpInside)
        okButton.snp.makeConstraints{ make in
            make.top.equalTo(nameLabel.snp.top)
            make.trailing.equalTo(userTextField.snp.trailing)
        }
        
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.setTitleColor(.white, for: .normal)
        cancelButton.addTarget(self, action: #selector(didCancelButton), for: .touchUpInside)
        cancelButton.snp.makeConstraints{ make in
            make.top.equalTo(nameLabel.snp.top)
            make.leading.equalTo(userTextField.snp.leading)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userTextField.resignFirstResponder()
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
        let rangeOfTextToReplace = Range(range, in: textFieldText) else {
            return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.utf16.count - substringToReplace.utf16.count + string.count
        
        if count > 20 {
            return false
        } else {
            self.textFieldCountLabel.text = "\(count) / 20"
            
            return count - 1 < 20
        }
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textFieldCountLabel.text = "0 / 20"
        
        return true
    }
    
    @objc func didCancelButton() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func didOkButton() {
        let statusMessage = userTextField.text ?? ""
        editNameLable?(statusMessage)
        
        userTextField.resignFirstResponder()
        
        dismiss(animated: true, completion: nil)
    }
}
