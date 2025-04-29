//
//  TabViewController.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 4/29/25.
//

import UIKit

import SnapKit
import Then

final class TabViewController: BaseUIViewController {
    private let headerView = HeaderView()
    private let tabTitles = ["홈", "드라마", "예능", "영화", "스포츠", "뉴스"]
    private lazy var tabViewControllers: [UIViewController] = [HomeViewController(),
                                                               DramaViewController(),
                                                               EntertainmentViewController(),
                                                               MovieViewController(),
                                                               SportsViewController(),
                                                               NewsViewController()]
    private var selectedIndex: Int = 0
    private let tabCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    private let flowLayout = UICollectionViewFlowLayout()
    private let dividerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        
        pushViewController(index: selectedIndex)
        
        setUI()
        setLayout()
        setStyle()
        setEvent()
    }
    
    override func setUI() {
        view.addSubviews(headerView, tabCollectionView, dividerView)
    }
    
    override func setLayout() {
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.horizontalEdges.equalToSuperview()
        }
        
        tabCollectionView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        dividerView.snp.makeConstraints {
            $0.top.equalTo(tabCollectionView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    override func setStyle() {
        tabCollectionView.do {
            $0.collectionViewLayout = flowLayout
            $0.backgroundColor = .black
            $0.delegate = self
            $0.dataSource = self
        }
        
        flowLayout.do {
            $0.scrollDirection = .horizontal
            $0.minimumInteritemSpacing = 28
            $0.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        }
        
        dividerView.do {
            $0.backgroundColor = .gray4
        }
    }
    
    override func setEvent() {
        tabCollectionView
            .register(TabViewCell.self, forCellWithReuseIdentifier: TabViewCell.cellIdentifier)
    }
    
}

extension TabViewController {
    // viewController 전환함수
    private func pushViewController(index: Int) {
        let selectedVC = tabViewControllers[index]
        children.forEach {
            $0.willMove(toParent: nil)
            $0.view.removeFromSuperview()
            $0.removeFromParent()
        }
        addChild(selectedVC)
        view.addSubview(selectedVC.view)
        selectedVC.view.snp.makeConstraints {
            $0.top.equalTo(tabCollectionView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        selectedVC.didMove(toParent: self)
    }
}

extension TabViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabTitles.count
    }
}

extension TabViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabViewCell.cellIdentifier, for: indexPath) as? TabViewCell else {
            return UICollectionViewCell()
        }
        let isSelected = indexPath.item == selectedIndex
        cell.configure(title: tabTitles[indexPath.item], selected: isSelected)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.item
        collectionView.reloadData()
        pushViewController(index: selectedIndex)
    }
}
