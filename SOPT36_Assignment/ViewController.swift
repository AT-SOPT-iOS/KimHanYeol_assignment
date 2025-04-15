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
    private let pwView = UIView()
    private let pwTextField = UITextField()
    private let loginButton = UIButton()
    private let findIDButton = UIButton()
    private let findPWButton = UIButton()
    private let validateLabel = UILabel()
    lazy private var visibleToggleButton = UIButton()
    private var visibleImage: Bool = true
    private let clearTextButton = UIButton()
    
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
                findIDButton,
                findPWButton,
                validateLabel
            )
        pwView.addSubviews(pwTextField, clearTextButton, visibleToggleButton)
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
        
        pwView.backgroundColor = .darkGray
        pwView.layer.cornerRadius = 5

        pwTextField.placeholder = "비밀번호"
        pwTextField.textColor = .white
        pwTextField.setPlaceholderColor(color: .lightGray)
        pwTextField.addLeftPadding(width: 10)
        pwTextField.isSecureTextEntry = true
        pwTextField.configureDefaultSettings()
        pwTextField.backgroundColor = .clear
        pwTextField.addTarget(self, action: #selector(passwordTextChanged), for: .editingChanged)

        clearTextButton.setBackgroundImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        clearTextButton.tintColor = .gray
        clearTextButton.isHidden = true
        clearTextButton.addTarget(self, action: #selector(clearPasswordText), for: .touchUpInside)

        visibleToggleButton.setBackgroundImage(UIImage(systemName: "eye"), for: .normal)
        visibleToggleButton.tintColor = .gray
        visibleToggleButton.addTarget(self, action: #selector(visibleToggle), for: .touchUpInside)
        visibleToggleButton.isHidden = true
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
    
}

