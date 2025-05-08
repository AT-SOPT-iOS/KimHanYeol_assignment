//
//  LogoView.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 4/30/25.
//

import UIKit

import SnapKit
import Then

final class LogoView: UIView {
    private var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewLayout()
    )
    private let mockData = LogoModel.dummy()

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
        self.addSubviews(collectionView)
    }
    
    func setLayout() {
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(200)
            $0.bottom.equalToSuperview()
        }
    }
    
    func setStyle() {
        collectionView.do {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            $0.collectionViewLayout = layout
            $0.register(LogoCell.self,
                        forCellWithReuseIdentifier: LogoCell.cellIdentifier)
            $0.delegate = self
            $0.dataSource = self
            $0.backgroundColor = .black
            $0.showsHorizontalScrollIndicator = false
        }
    }
    
}

extension LogoView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        7
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 90, height: 45)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
    }
}

extension LogoView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mockData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: LogoCell
                .cellIdentifier,
            for: indexPath) as? LogoCell else {
            return UICollectionViewCell()
        }

        cell.configure(model: mockData[indexPath.row])
        
        return cell
    }
}
