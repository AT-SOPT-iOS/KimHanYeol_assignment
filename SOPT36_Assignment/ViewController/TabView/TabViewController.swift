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
    private let scrollView = UIScrollView()
    private let contentView = UIView()

    private let tabTitles = ["홈", "드라마", "예능", "영화", "스포츠", "뉴스"]

    private lazy var tabViewControllers: [UIView] = [HomeView(),
                                                       DramaView(),
                                                       EntertainmentView(),
                                                       MovieView(),
                                                       SportsView(),
                                                       NewsView()]
    private var selectedIndex: Int = 0
    private let tabCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    private let flowLayout = UICollectionViewFlowLayout()
    private let dividerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        setUI()
        setLayout()
        setStyle()
        setEvent()
        
        displayContentView(index: selectedIndex)
    }
    
    override func setUI() {
        view.addSubviews(headerView, tabCollectionView, dividerView, scrollView)
        scrollView.addSubview(contentView)
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
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(dividerView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.width.equalToSuperview()
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
        
        scrollView.do {
            $0.isScrollEnabled = true
            $0.showsVerticalScrollIndicator = true
            $0.clipsToBounds = true
            $0.showsVerticalScrollIndicator = false
        }
        
    }
    
    override func setEvent() {
        tabCollectionView
            .register(TabViewCell.self, forCellWithReuseIdentifier: TabViewCell.cellIdentifier)
    }
    
}

extension TabViewController {
    private func displayContentView(index: Int) {
        contentView.subviews.forEach { $0.removeFromSuperview() }

        let selectedView = tabViewControllers[index]
        contentView.addSubview(selectedView)

        selectedView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
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
        displayContentView(index: selectedIndex)
    }
}

