//
//  TodayTopView.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 4/30/25.
//

import UIKit

final class TodayTopView: BaseView {
    private var todayToplabel = UILabel()
    private var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewLayout()
    )

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
        setStyle()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUI() {
        self.addSubviews(todayToplabel, collectionView)
    }
    
    override func setLayout() {
        todayToplabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(12)
            $0.height.equalTo(23)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(todayToplabel.snp.bottom).offset(9)
            $0.bottom.equalToSuperview()
        }
    }
    
    override func setStyle() {
        todayToplabel.do {
            $0.text = "오늘의 티빙 TOP 20"
            $0.font = .soptFont(.subhead1Bold)
            $0.textColor = .white
        }
        
        collectionView.do {
            let layout = UICollectionViewFlowLayout()
            $0.collectionViewLayout = layout
            $0.delegate = self
            $0.dataSource = self
            $0.register(TodayTopCollectionViewCell.self,
                        forCellWithReuseIdentifier: TodayTopCollectionViewCell.cellIdentifier)
        }
        
    }
    
}

extension TodayTopView: UICollectionViewDelegateFlowLayout {
    
}

extension TodayTopView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
}
