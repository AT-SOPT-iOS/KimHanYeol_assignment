//
//  BaseballCell.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 4/30/25.
//

import UIKit

import SnapKit
import Then

class BaseballCell: UICollectionViewCell {
    private let baseView = UIView()
    private let posterImage = UIImageView()
    
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
        contentView.addSubviews(baseView, posterImage)
    }
    
    private func setLayout() {
        baseView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
            $0.size.equalTo(CGSize(width: 80, height: 50))
        }
        
        posterImage.snp.makeConstraints {
            $0.center.equalTo(baseView)
            $0.size.equalTo(CGSize(width: 40, height: 40))
        }
    }
    
    private func setStyle() {
        posterImage.do {
            $0.contentMode = .scaleAspectFill
        }
    }
    
    // MARK: - Configure Cell
    
    func configure(model: BaseballModel) {
        posterImage.image = model.posterImage
        baseView.backgroundColor = model.backgroundColor
    }
}
