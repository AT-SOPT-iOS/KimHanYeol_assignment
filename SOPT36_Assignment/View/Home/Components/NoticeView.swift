//
//  NoticeView.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 4/30/25.
//

import UIKit

import SnapKit
import Then

final class NoticeView: UIView {
    
    private let containerView = UIView()
    private let titleLabel = UILabel()
    private let messageLabel = UILabel()
    private let chevronImageView = UIImageView()
    private let topInfoLabel = UILabel()
    private let bottomInfoLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.addSubviews(containerView, topInfoLabel, bottomInfoLabel)
        containerView.addSubviews(titleLabel, messageLabel, chevronImageView)
    }
    
    private func setLayout() {
        containerView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(5)
            $0.horizontalEdges.equalToSuperview().inset(14)
            $0.height.equalTo(50)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        }
        
        messageLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.trailing).offset(8)
            $0.centerY.equalToSuperview()
        }
        
        chevronImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
            $0.size.equalTo(18)
        }
        
        topInfoLabel.snp.makeConstraints {
            $0.top.equalTo(containerView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
        }

        bottomInfoLabel.snp.makeConstraints {
            $0.top.equalTo(topInfoLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
        }
    }
    
    private func setStyle() {
        containerView.do {
            $0.backgroundColor = .gray4
            $0.layer.cornerRadius = 5
        }
        
        titleLabel.do {
            $0.text = "공지"
            $0.textColor = .gray2
            $0.font = .customFont(weight: .medium, size: 12)
        }
        
        messageLabel.do {
            $0.text = "티빙 계정 공유 정책 추가 안내"
            $0.textColor = .gray1
            $0.font = .customFont(weight: .medium, size: 12)
        }
        
        chevronImageView.do {
            $0.image = UIImage(systemName: "chevron.right")
            $0.tintColor = .white
            $0.contentMode = .scaleAspectFit
        }
        
        topInfoLabel.do {
            $0.text = "고객문의 · 이용약관 · 개인정보처리방침"
            $0.textColor = .gray2
            $0.font = .customFont(weight: .medium, size: 12)
        }

        bottomInfoLabel.do {
            $0.text = "사업자정보 · 인재채용"
            $0.textColor = .gray2
            $0.font = .customFont(weight: .medium, size: 12)
        }
    }
}
