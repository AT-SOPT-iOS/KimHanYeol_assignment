//
//  TodayTopView.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 4/30/25.
//

import UIKit

final class TodayTopView: UIView {
    private var todayToplabel = UILabel()
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
        self.addSubviews(todayToplabel, collectionView)
    }
    
    func setLayout() {
        todayToplabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(12)
            $0.height.equalTo(23)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(todayToplabel.snp.bottom).offset(9)
            $0.width.equalToSuperview()
            $0.height.equalTo(200)
            $0.bottom.equalToSuperview()
        }
    }
    
    func setStyle() {
        todayToplabel.do {
            $0.text = "오늘의 티빙 TOP 20"
            $0.font = .soptFont(.subhead1Bold)
            $0.textColor = .white
        }
        
        collectionView.do {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            $0.collectionViewLayout = layout
            $0.register(TodayTopCollectionViewCell.self,
                        forCellWithReuseIdentifier: TodayTopCollectionViewCell.cellIdentifier)
            $0.delegate = self
            $0.dataSource = self
            $0.backgroundColor = .black
            $0.showsHorizontalScrollIndicator = false
        }
    }
    
}

extension TodayTopView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 150, height: 150)
    }
    
}

extension TodayTopView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mockData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TodayTopCollectionViewCell
                .cellIdentifier,
            for: indexPath) as? TodayTopCollectionViewCell else {
            return UICollectionViewCell()
        }

        cell.configure(model: mockData[indexPath.row])
        
        return cell
    }
}
