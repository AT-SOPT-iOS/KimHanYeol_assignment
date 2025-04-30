//
//  TodayTopCollectionViewCell.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 4/30/25.
//

import UIKit

import SnapKit
import Then

class TodayTopCollectionViewCell: UICollectionViewCell {
    private let indexLabel = UILabel()
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
        contentView.addSubviews(indexLabel, posterImage)
    }
    
    private func setLayout() {
        indexLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        posterImage.snp.makeConstraints {
            $0.leading.equalTo(indexLabel.snp.trailing).offset(10)
            $0.size.equalTo(CGSize(width: 100, height: 150))
            $0.bottom.equalToSuperview()
        }
    }
    
    private func setStyle() {
        indexLabel.do {
            $0.textColor = .white
            $0.font = .italicSystemFont(ofSize: 50)
        }
        
        posterImage.do {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
    }
    
    // MARK: - Configure Cell
    
    func configure(model: PosterModel) {
        posterImage.image = model.posterImage
        indexLabel.text = model.id.description
    }
}
