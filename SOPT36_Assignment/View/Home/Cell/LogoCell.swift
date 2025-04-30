//
//  LogoCell.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 4/30/25.
//

import UIKit

import SnapKit
import Then

class LogoCell: UICollectionViewCell {
    private let baseView = UIView()
    private let logoImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
        setStyle()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        contentView.addSubviews(baseView, logoImage)
    }
    
    private func setLayout() {
        baseView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
            $0.size.equalTo(CGSize(width: 90, height: 45))
        }
        
        logoImage.snp.makeConstraints {
            $0.center.equalTo(baseView)
            $0.size.equalTo(CGSize(width: 70, height: 35))
        }
    }
    
    private func setStyle() {
        baseView.do {
            $0.backgroundColor = .gray4
            $0.layer.cornerRadius = 4
            $0.clipsToBounds = true
        }
        
        logoImage.do {
            $0.contentMode = .scaleAspectFill
        }
    }
    
    // MARK: - Configure Cell
    
    func configure(model: LogoModel) {
        logoImage.image = model.posterImage
    }
}
