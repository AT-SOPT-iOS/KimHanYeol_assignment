//
//  ViewController.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 4/16/25.
//

import UIKit

import SnapKit

class ViewController: UIViewController {
    
    private let baseView = UIView()
    private let backButton = UIButton()
    private let titleLabel = UILabel()
    private let idTextField = UITextField()
    
    private let pwStackView = UIStackView()
    private let pwView = UIView()
    private let pwTextField = UITextField()
    lazy private var visibleToggleButton = UIButton()
    private var visibleImage: Bool = true
    private let clearTextButton = UIButton()
    
    private let loginButton = UIButton()
    
    private let findView = UIView()
    private let findIDButton = UIButton()
    private let findPWButton = UIButton()
    private let divideIcon = UILabel()
    
    private let validateView = UIView()
    private let validateLabel = UILabel()
    private let signinButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setStyle()
        setLayout()
    }
    
    private func setUI() {
        view.addSubview(baseView)
        baseView
            .addSubviews(
                backButton,
                titleLabel,
                idTextField,
                pwView,
                loginButton,
                findView,
                validateView
            )
        pwView.addSubviews(pwTextField, clearTextButton, visibleToggleButton)
        findView.addSubviews(findIDButton, divideIcon, findPWButton)
        validateView.addSubviews(validateLabel, signinButton)
    }
    
    private func setStyle() {
        baseView.backgroundColor = .black
        
        backButton.setBackgroundImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = .white
        
        titleLabel.text = "TVING ID 로그인"
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 24)
        
        idTextField.placeholder = "아이디"
        idTextField.backgroundColor = .darkGray
        idTextField.textColor = .white
        idTextField.setPlaceholderColor(color: .lightGray)
        idTextField.addLeftPadding(width: 20)
        idTextField.configureDefaultSettings()
        idTextField.layer.cornerRadius = 5
        idTextField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        idTextField.delegate = self
        
        pwView.backgroundColor = .darkGray
        pwView.layer.cornerRadius = 5
        
        pwTextField.placeholder = "비밀번호"
        pwTextField.backgroundColor = .clear
        pwTextField.textColor = .white
        pwTextField.setPlaceholderColor(color: .lightGray)
        pwTextField.addLeftPadding(width: 10)
        pwTextField.isSecureTextEntry = true
        pwTextField.configureDefaultSettings()
        pwTextField.addTarget(self, action: #selector(passwordTextChanged), for: .editingChanged)
        pwTextField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        pwTextField.delegate = self
        
        clearTextButton.setBackgroundImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        clearTextButton.tintColor = .gray
        clearTextButton.isHidden = true
        clearTextButton.addTarget(self, action: #selector(clearPasswordText), for: .touchUpInside)
        
        visibleToggleButton.setBackgroundImage(UIImage(systemName: "eye"), for: .normal)
        visibleToggleButton.tintColor = .gray
        visibleToggleButton.addTarget(self, action: #selector(visibleToggle), for: .touchUpInside)
        visibleToggleButton.isHidden = true
        
        loginButton.setTitle("로그인하기", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = .black
        loginButton.layer.cornerRadius = 5
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.gray.cgColor
        
        findIDButton.setTitle("아이디 찾기", for: .normal)
        findIDButton.setTitleColor(.lightGray, for: .normal)
        findIDButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        
        findPWButton.setTitle("비밀번호 찾기", for: .normal)
        findPWButton.setTitleColor(.lightGray, for: .normal)
        findPWButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        
        divideIcon.text = "|"
        divideIcon.textColor = .lightGray
        divideIcon.font = .systemFont(ofSize: 14)
        
        validateLabel.text = "아직 계정이 없으신가요?"
        validateLabel.textColor = .gray
        validateLabel.font = .systemFont(ofSize: 12)
        
        let underlineAttrString = NSAttributedString(
            string: "TVING ID 회원가입하기",
            attributes: [
                .foregroundColor: UIColor.gray,
                .font: UIFont.systemFont(ofSize: 14, weight: .bold),
                .underlineStyle: NSUnderlineStyle.single.rawValue
            ]
        )
        signinButton.setAttributedTitle(underlineAttrString, for: .normal)
    }
    
    private func setLayout() {
        baseView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        backButton.snp.makeConstraints {
            $0.top.equalTo(70)
            $0.leading.equalTo(20)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(backButton.snp.bottom).offset(24)
        }
        
        idTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(50)
            $0.width.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        
        pwView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(idTextField.snp.bottom).offset(10)
            $0.width.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        
        pwTextField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.top.bottom.equalToSuperview()
            $0.trailing.equalTo(clearTextButton.snp.leading).offset(-8)
        }
        
        visibleToggleButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(10)
            $0.width.height.equalTo(24)
        }
        
        clearTextButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(visibleToggleButton.snp.leading).offset(-8)
            $0.width.height.equalTo(24)
        }
        
        loginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(pwView.snp.bottom).offset(20)
            $0.width.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        findView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(loginButton.snp.bottom).offset(20)
            $0.width.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        findIDButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(40)
            $0.centerY.equalToSuperview()
        }
        
        divideIcon.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        findPWButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(40)
            $0.centerY.equalToSuperview()
        }
        
        validateView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(findView.snp.bottom).offset(20)
            $0.width.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        validateLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
        }
        
        signinButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
        }
        
    }
    
    @objc private func visibleToggle() {
        visibleImage.toggle()
        pwTextField.isSecureTextEntry = visibleImage
        visibleToggleButton.setBackgroundImage(
            UIImage(systemName: visibleImage ? "eye" : "eye.slash"),
            for: .normal
        )
    }
    
    @objc private func clearPasswordText() {
        pwTextField.text = ""
        clearTextButton.isHidden = true
        visibleToggleButton.isHidden = true
    }
    
    @objc private func passwordTextChanged() {
        if pwTextField.text == "" || pwTextField.text == nil{
            clearTextButton.isHidden = true
            visibleToggleButton.isHidden = true
        } else {
            clearTextButton.isHidden = false
            visibleToggleButton.isHidden = false
        }
    }
    
    @objc private func textFieldEditingChanged() {
        let isIDEmpty = idTextField.text?.isEmpty ?? true
        let isPWEmpty = pwTextField.text?.isEmpty ?? true
        
        loginButton.isEnabled = !(isIDEmpty || isPWEmpty)
        loginButton.backgroundColor = loginButton.isEnabled ? .red : .black
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == idTextField {
            idTextField.layer.borderColor = UIColor.white.cgColor
            idTextField.layer.borderWidth = 1
        } else if textField == pwTextField {
            pwView.layer.borderColor = UIColor.white.cgColor
            pwView.layer.borderWidth = 1
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == idTextField {
            idTextField.layer.borderColor = UIColor.clear.cgColor
            idTextField.layer.borderWidth = 0
        } else if textField == pwTextField {
            pwView.layer.borderColor = UIColor.clear.cgColor
            pwView.layer.borderWidth = 0
        }
    }
}
