//
//  TabViewCell.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 4/30/25.
//

import UIKit

import SnapKit
import Then

final class TabViewCell: UICollectionViewCell {
    private let titleLabel = UILabel()
    private var selectedState: Bool = false
    private let titleUnderlineView = UIView()
    
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
        contentView.addSubviews(titleLabel, titleUnderlineView)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        titleUnderlineView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).inset(5)
            $0.height.equalTo(4)
            $0.horizontalEdges.equalToSuperview().inset(10)
        }
    }
    
    private func setStyle() {
        titleLabel.do {
            $0.font = .customFont(weight: .regular, size: 17)
            $0.textColor = .white
            $0.textAlignment = .center
        }
        
        titleUnderlineView.do {
            $0.backgroundColor = .white
        }
    }
    
    func configure(title: String, selected: Bool) {
        titleLabel.text = title
        selectedState = selected
        titleUnderlineView.isHidden = !selected
    }
}
