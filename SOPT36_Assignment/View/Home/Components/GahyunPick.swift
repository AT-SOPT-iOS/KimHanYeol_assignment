//
//  GahyunPick.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 4/30/25.
//

import UIKit

import SnapKit
import Then

final class GahyunPick: UIView {
    private let gahyunPickLabel = UILabel()
    private var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewLayout()
    )
    private let mockData = GahyunPickModel.dummy()
    private let pageControl = UIPageControl()
    
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
        self.addSubviews(gahyunPickLabel, pageControl, collectionView)
    }
    
    private func setLayout() {
        gahyunPickLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(12)
            $0.height.equalTo(23)
        }
        
        pageControl.snp.makeConstraints {
            $0.centerY.equalTo(gahyunPickLabel)
            $0.trailing.equalToSuperview().inset(12)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(gahyunPickLabel.snp.bottom).offset(9)
            $0.width.equalToSuperview()
            $0.height.equalTo(200)
            $0.bottom.equalToSuperview()
        }
    }
    
    private func setStyle() {
        gahyunPickLabel.do {
            $0.text = "김가현PD의 인생작 TOP 6"
            $0.font = .soptFont(.subhead3Bold)
            $0.textColor = .white
        }
        
        pageControl.do {
            $0.numberOfPages = mockData.count
            $0.currentPage = 0
            $0.currentPageIndicatorTintColor = .white
            $0.pageIndicatorTintColor = .gray4
        }
        
        collectionView.do {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            $0.collectionViewLayout = layout
            $0.register(GahyunPickCell.self,
                        forCellWithReuseIdentifier: GahyunPickCell.cellIdentifier)
            $0.delegate = self
            $0.dataSource = self
            $0.backgroundColor = .black
            $0.showsHorizontalScrollIndicator = false
        }
    }
    
    private func updatePagingIcon(currentPage: Int) {
        pageControl.currentPage = currentPage
    }
    
    func scrollViewWillEndDragging(
        _ scrollView: UIScrollView,
        withVelocity velocity: CGPoint,
        targetContentOffset: UnsafeMutablePointer<CGPoint>
    ) {
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }

        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        let estimatedIndex = scrollView.contentOffset.x / cellWidthIncludingSpacing
        let targetIndex = velocity.x == 0 ? round(estimatedIndex) : (velocity.x > 0 ? ceil(estimatedIndex) : floor(estimatedIndex))

        let xOffset = targetIndex * cellWidthIncludingSpacing - layout.sectionInset.left
        targetContentOffset.pointee = CGPoint(x: xOffset, y: 0)

        updatePagingIcon(currentPage: Int(targetIndex))
    }
}

extension GahyunPick: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 160, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0)
    }
}

extension GahyunPick: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mockData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: GahyunPickCell
                .cellIdentifier,
            for: indexPath) as? GahyunPickCell else {
            return UICollectionViewCell()
        }

        cell.configure(model: mockData[indexPath.row])
        
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        updatePagingIcon(currentPage: indexPath.row)
//    }
}
