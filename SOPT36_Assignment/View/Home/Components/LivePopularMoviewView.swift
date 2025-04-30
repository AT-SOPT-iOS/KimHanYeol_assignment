//
//  LivePopularMoviewView.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 4/30/25.
//

import UIKit

final class LivePopularMoviewView: UIView {
    private var livePopularMoviewLabel = UILabel()
    private let moreButton = UIButton()
    private var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewLayout()
    )
    private let mockData = PosterModel.dummy()

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
        self.addSubviews(livePopularMoviewLabel, moreButton, collectionView)
    }
    
    func setLayout() {
        livePopularMoviewLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(12)
            $0.height.equalTo(23)
        }
        
        moreButton.snp.makeConstraints {
            $0.centerY.equalTo(livePopularMoviewLabel)
            $0.trailing.equalToSuperview().inset(4)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(livePopularMoviewLabel.snp.bottom).offset(9)
            $0.width.equalToSuperview()
            $0.height.equalTo(200)
            $0.bottom.equalToSuperview()
        }
    }
    
    func setStyle() {
        livePopularMoviewLabel.do {
            $0.text = "실시간 인기 영화"
            $0.font = .soptFont(.subhead1Bold)
            $0.textColor = .white
        }
        
        moreButton.do {
            $0.setTitle("더보기", for: .normal)
            $0.setTitleColor(.gray2, for: .normal)
            $0.titleLabel?.font = .customFont(weight: .semiBold, size: 12)
        }
        
        collectionView.do {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            $0.collectionViewLayout = layout
            $0.register(LivePopularMovieCell.self,
                        forCellWithReuseIdentifier: LivePopularMovieCell.cellIdentifier)
            $0.delegate = self
            $0.dataSource = self
            $0.backgroundColor = .black
        }
    }
    
}

extension LivePopularMoviewView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 120, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0)
    }
}

extension LivePopularMoviewView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mockData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: LivePopularMovieCell
                .cellIdentifier,
            for: indexPath) as? LivePopularMovieCell else {
            return UICollectionViewCell()
        }

        cell.configure(model: mockData[indexPath.row])
        
        return cell
    }
}
