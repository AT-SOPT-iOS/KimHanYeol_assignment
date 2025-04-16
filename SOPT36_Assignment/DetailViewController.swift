//
//  DetailViewController.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 4/17/25.
//

import UIKit

import SnapKit

protocol DataBindDelegate: AnyObject {
    func databind(text: String)
}

class DetailViewController: UIViewController {
    weak var delegate: DataBindDelegate?

    private var mainText: String = ""
    
    private let baseView = UIView()
    private let titleView = UIView()
    private let titleLabel = UILabel()
    private let mainLabel = UILabel()
    private let backButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setStyle()
        setLayout()
        bindText()
    }
    
    private func setUI() {
        view.addSubview(baseView)
        baseView.addSubviews(titleView, mainLabel, backButton)
        titleView.addSubviews(titleLabel)
    }
    
    private func setStyle() {
        baseView.backgroundColor = .black

        titleView.backgroundColor = .red
        
        titleLabel.text = "TVING"
        titleLabel.font = .systemFont(ofSize: 86, weight: UIFont.Weight(CGFloat(1)))
        titleLabel.textColor = .black
        
        mainLabel.textColor = .white
        mainLabel.font = .systemFont(ofSize: 24, weight: .bold)
        mainLabel.numberOfLines = 2
        mainLabel.textAlignment = .center
        mainLabel.text = "\(mainText)님 반가워요!"
        
        
        backButton.setTitle("메인으로", for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        backButton.backgroundColor = .red
        backButton.layer.cornerRadius = 5
        backButton
            .addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    private func setLayout() {
        baseView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            $0.bottom.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
        }
        
        titleView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom).offset(70)
            $0.width.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
        }
        
        backButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(50)
            $0.width.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
    }
    
    private func bindText() {
        self.mainLabel.text = "\(mainText)님\n반가워요!"
    }
    
    func setLabelText(mainText: String) {
        self.mainText = mainText
    }
    
    @objc
    private func backButtonTapped() {
        delegate?.databind(text: mainText)
        
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}
