//
//  MainView.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 5/27/25.
//

import SwiftUI

enum StickyHeaderType: String, CaseIterable {
    case home = "홈"
    case drame = "드라마"
    case entertainment = "예능"
    case movie = "영화"
    case sports = "스포츠"
    case news = "뉴스"
}

struct MainView: View {
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .black
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        UISegmentedControl.appearance().setTitleTextAttributes([.font: self.font(.system(size: 17, weight: .bold))], for: .normal)
    }
    
    @State var selectedTab: StickyHeaderType = .home
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                tvingHeaderSection
                
                HStack(spacing: 10) {
                    ForEach(StickyHeaderType.allCases, id: \.self) { tab in
                        VStack(spacing: 0) {
                            Text(tab.rawValue)
                                .font(.system(size: 17, weight: .bold))
                                .foregroundColor(.white)
                                .frame(height: 27)
                                
                                .onTapGesture {
                                    selectedTab = tab
                                }
                            
                            Rectangle()
                                .frame(height: 3)
                                .foregroundColor(tab == selectedTab ? .white : .clear)
                                .padding(.top, 7)
                        }
                    }
                }
                
                mainBodySection
            }
        }
        .ignoresSafeArea()
        .background(.black)
        
    }
}

extension MainView {
    private var tvingHeaderSection: some View {
        HStack(alignment: .center, spacing: 0) {
            Image(.tvingLogo)
                .resizable()
                .frame(width: 191, height: 78)
            
            Spacer()
            Image(systemName: "magnifyingglass")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .padding(.trailing, 10)
                .foregroundStyle(.white)
            
            Image(.tvingIcon)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .padding(.trailing, 11)
        }
        .padding(.top, 21)
    }
    
    private var mainBodySection: some View {
        switch selectedTab {
        case .home:
            Text("홈")
        case .drame:
            Text("드라마")
        case .entertainment:
            Text("예능")
        case .movie:
            Text("영화")
        case .sports:
            Text("스포츠")
        case .news:
            Text("뉴스")
        }
    }
    
}

#Preview {
    MainView()
}
