//
//  LivePopularProgramCell.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 4/30/25.
//

import UIKit

import SnapKit
import Then

class LivePopularProgramCell: UICollectionViewCell {
    private let indexLabel = UILabel()
    private let posterImage = UIImageView()
    private let programTitle = UILabel()
    private let programDescription = UILabel()
    private let programRating = UILabel()
    
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
        contentView.addSubviews(posterImage, indexLabel, programTitle, programDescription, programRating)
    }
    
    private func setLayout() {
        posterImage.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.size.equalTo(CGSize(width: 160, height: 80))
            $0.top.equalToSuperview()
        }
        
        indexLabel.snp.makeConstraints {
            $0.top.equalTo(posterImage.snp.bottom).offset(7)
            $0.leading.equalTo(posterImage)
        }
        
        programTitle.snp.makeConstraints {
            $0.top.equalTo(posterImage.snp.bottom).offset(10)
            $0.leading.equalTo(indexLabel.snp.trailing).offset(5)
        }
        
        programDescription.snp.makeConstraints {
            $0.top.equalTo(programTitle.snp.bottom).offset(3)
            $0.leading.equalTo(programTitle)
        }
        
        programRating.snp.makeConstraints {
            $0.top.equalTo(programDescription.snp.bottom).offset(1)
            $0.leading.equalTo(programTitle)
        }
        
    }
    
    private func setStyle() {
        posterImage.do {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
        
        indexLabel.do {
            $0.textColor = .white
            $0.font = .italicSystemFont(ofSize: 20)
        }
        
        programTitle.do {
            $0.font = .customFont(weight: .semiBold, size: 14)
            $0.textColor = .white
        }
        
        programDescription.do {
            $0.font = .customFont(weight: .medium, size: 14)
            $0.textColor = .gray2
        }
        
        programRating.do {
            $0.font = .customFont(weight: .medium, size: 14)
            $0.textColor = .gray2
        }
    }
    
    // MARK: - Configure Cell
    
    func configure(model: ProgramModel) {
        posterImage.image = model.posterImage
        indexLabel.text = model.id.description
        programTitle.text = model.title
        programRating.text = model.rating
        programDescription.text = model.description
    }
}
