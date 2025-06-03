//
//  StickyHeaderView.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 6/3/25.
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

struct StickyHeaderView: View {
    @Binding var selectedTab: StickyHeaderType
    
    var body: some View {
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
                        .padding(.horizontal, 5)
                }
            }
        }
        .padding(.bottom, 7)
        .background(.black)
    }
}
