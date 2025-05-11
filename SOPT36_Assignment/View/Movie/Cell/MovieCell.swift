//
//  MovieCell.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 5/11/25.
//

import UIKit

import SnapKit
import Then

final class MovieCell: UITableViewCell {

    static let identifier = "MovieCell"

    private let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.textColor = .white
    }
    
    private let rankLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .white
    }
    
    private let audienceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .white
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .gray
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUI() {
        contentView.addSubviews(rankLabel, titleLabel, audienceLabel)
    }

    private func setLayout() {
        rankLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalToSuperview().offset(10)
        }

        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(rankLabel.snp.trailing).offset(10)
            $0.centerY.equalTo(rankLabel)
        }

        audienceLabel.snp.makeConstraints {
            $0.leading.equalTo(rankLabel)
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(10)
        }
    }

    func configure(with movie: DailyBoxOffice) {
        rankLabel.text = "\(movie.rank)위"
        titleLabel.text = movie.movieNm
        audienceLabel.text = "관객수: \(movie.audiCnt), 누적: \(movie.audiAcc)"
    }
}
