//
//  HeaderView.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 4/30/25.
//

import UIKit

import SnapKit
import Then

final class HeaderView: UIView {
    private let tvingLogo = UIImageView()
    private let searchIcon = UIImageView()
    private let tvingIcon = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
        setStyle()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUI() {
        addSubviews(tvingLogo, searchIcon, tvingIcon)
    }

    func setLayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(80)
        }

        tvingLogo.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview()
            $0.width.equalTo(190)
            $0.height.equalTo(80)
        }

        searchIcon.snp.makeConstraints {
            $0.centerY.equalTo(tvingLogo.snp.centerY)
            $0.trailing.equalToSuperview().inset(50)
            $0.size.equalTo(30)
        }

        tvingIcon.snp.makeConstraints {
            $0.centerY.equalTo(tvingLogo.snp.centerY)
            $0.trailing.equalToSuperview().inset(10)
            $0.size.equalTo(30)
        }
    }

    func setStyle() {
        tvingLogo.do {
            $0.image = UIImage(resource: .tvingLogo)
            $0.contentMode = .scaleAspectFill
        }

        searchIcon.do {
            $0.image = UIImage(systemName: "magnifyingglass")
            $0.contentMode = .scaleAspectFit
            $0.tintColor = .white
        }

        tvingIcon.do {
            $0.image = UIImage(resource: .tvingIcon)
            $0.contentMode = .scaleAspectFit
        }
    }
}
