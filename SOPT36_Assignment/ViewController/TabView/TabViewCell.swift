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

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        contentView.addSubview(titleLabel)
        titleLabel.do {
            $0.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            $0.textColor = .white
            $0.textAlignment = .center
        }
    }

    private func setupLayout() {
        titleLabel.snp.makeConstraints { $0.edges.equalToSuperview() }
    }

    func configure(title: String, selected: Bool) {
        titleLabel.text = title
        titleLabel.textColor = selected ? .yellow : .white
        contentView.layer.borderWidth = selected ? 2 : 0
        contentView.layer.borderColor = selected ? UIColor.yellow.cgColor : UIColor.clear.cgColor
    }
}
