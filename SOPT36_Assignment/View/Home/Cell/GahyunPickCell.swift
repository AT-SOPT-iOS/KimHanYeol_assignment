//
//  GahyunPickCell.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 4/30/25.
//

import UIKit

import SnapKit
import Then

class GahyunPickCell: UICollectionViewCell {
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
        contentView.addSubviews(posterImage)
    }
    
    private func setLayout() {
        posterImage.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.size.equalTo(CGSize(width: 160, height: 90))
            $0.top.equalToSuperview()
        }
        
    }
    
    private func setStyle() {
        posterImage.do {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 3
        }
    }
    
    // MARK: - Configure Cell
    
    func configure(model: GahyunPickModel) {
        posterImage.image = model.posterImage
    }
}
