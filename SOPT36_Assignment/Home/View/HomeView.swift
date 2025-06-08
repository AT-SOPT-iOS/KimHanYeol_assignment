//
//  HomeView.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 6/3/25.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: - Property Wrappers

    @State private var currentIndex: Int = 0
    @State private var scrollOffsets: [Int: CGFloat] = [:]
    
    //MARK: - Properties

    let rows = [GridItem(.flexible())]
    let titleImages = PosterModel.dummy()
    let liveImages = ProgramModel.dummy()
    let baseballImages = BaseballModel.dummy()
    let logoImages = LogoModel.dummy()
    
    //MARK: - Main Body

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            titleImageSection
            todayTvingSection
            livePopularSection
            movieSection
            baseballSection
            logoSection
            gahyunSection
            noticeSection
            etcSection
        }
    }
}


//MARK: - UI Properties

extension HomeView {
    
    @ViewBuilder
    private var titleImageSection: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows) {
                ForEach(titleImages.indices, id: \.self) { index in
                    Image(uiImage: titleImages[index].posterImage)
                        .resizable()
                        .frame(width: 375, height: 400)
                }
            }
            .padding(.bottom, 9)
        }
    }
    
    @ViewBuilder
    private var todayTvingSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("오늘의 티빙 TOP 20")
                .font(.system(size: 15, weight: .bold))
                .padding(.bottom, 9)
                .padding(.leading, 12)
                .foregroundStyle(.white)
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows) {
                    ForEach(titleImages.indices, id: \.self) { index in
                        HStack(alignment: .bottom, spacing: 0) {
                            Text("\(index + 1)")
                                .font(.system(size: 50, weight: .bold))
                                .italic()
                                .foregroundColor(.white)
                                .padding(.trailing, 10)
                            
                            Image(uiImage: titleImages[index].posterImage)
                                .resizable()
                                .frame(width: 98, height: 146)
                        }
                        .padding(.trailing, 5)
                    }
                }
                .padding(.horizontal, 5)
            }
        }
        .padding(.bottom, 20)
    }
    
    @ViewBuilder
    private var livePopularSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .center, spacing: 0) {
                Text("실시간 인기 LIVE")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(.white)
                Spacer()
                Text("더보기")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(.gray)
            }
            .padding(.bottom, 9)
            .padding(.horizontal, 12)
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows) {
                    ForEach(liveImages.indices, id: \.self) { index in
                        VStack(alignment: .leading, spacing: 0) {
                            Image(uiImage: liveImages[index].posterImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 160, height: 80)
                                .padding(.bottom, 15)
                            
                            HStack(alignment: .top, spacing: 2) {
                                Text("\(index + 1)")
                                    .font(.system(size: 19, weight: .bold))
                                    .italic()
                                    .foregroundColor(.white)
                                    .padding(.trailing, 10)
                                
                                VStack(alignment: .leading, spacing: 0) {
                                    Text(liveImages[index].title)
                                        .font(.system(size: 10, weight: .bold))
                                        .foregroundColor(.white)
                                    Text(liveImages[index].description)
                                        .font(.system(size: 10, weight: .semibold))
                                        .foregroundColor(.gray2)
                                    Text(liveImages[index].rating)
                                        .font(.system(size: 10, weight: .semibold))
                                        .foregroundColor(.gray2)
                                }
                            }
                            .padding(.horizontal, 6)
                        }
                    }
                }
                .padding(.horizontal, 12)
            }
        }
        .padding(.bottom, 18)
    }
    
    @ViewBuilder
    private var movieSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .center, spacing: 0) {
                Text("실시간 인기 영화")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(.white)
                Spacer()
                Text("더보기")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(.gray)
            }
            .padding(.bottom, 9)
            .padding(.horizontal, 12)
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows, spacing: 8) {
                    ForEach(titleImages.indices, id: \.self) { index in
                        Image(uiImage: titleImages[index].posterImage)
                            .resizable()
                            .frame(width: 98, height: 146)
                    }
                }
                .padding(.horizontal, 15)
            }
        }
        .padding(.bottom, 28)
    }
    
    @ViewBuilder
    private var baseballSection: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, spacing: 0) {
                ForEach(baseballImages.indices, id: \.self) { index in
                    Image(uiImage: baseballImages[index].posterImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 5)
                        .background(index%2==0 ? .white : .black)
                }
            }
        }
        .padding(.bottom, 28)
    }
    
    @ViewBuilder
    private var logoSection: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, spacing: 7) {
                ForEach(logoImages.indices, id: \.self) { index in
                    Image(uiImage: logoImages[index].posterImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 68, height: 34)
                        .padding(.horizontal, 11)
                        .padding(.vertical, 5)
                        .background(.gray4)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }
            }
            .padding(.horizontal, 15)
        }
        .padding(.bottom, 25)
    }
    
    @ViewBuilder
    private var gahyunSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .center, spacing: 2) {
                Text("김가현PD의 인생작 TOP 6")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(.white)
                Spacer()
                ForEach(0..<liveImages.count, id: \.self) { index in
                    Circle()
                        .fill(index == currentIndex ? .white : .gray)
                        .frame(width: 4, height: 4)
                }
            }
            .padding(.bottom, 13)
            .padding(.horizontal, 12)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(Array(liveImages.enumerated()), id: \.offset) { index, item in
                        GeometryReader { proxy in
                            let frame = proxy.frame(in: .global)
                            
                            Image(uiImage: item.posterImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 160, height: 90)
                                .clipped()
                                .cornerRadius(3)
                                .preference(key: ScrollOffsetPreferenceKey.self, value: [index: frame.minX])
                        }
                        .frame(width: 160, height: 90)
                    }
                }
                .padding(.horizontal, 12)
            }
            .onPreferenceChange(ScrollOffsetPreferenceKey.self) { values in
                scrollOffsets = values
                
                if let maxOffset = values.max(by: { $0.value < $1.value }),
                   let lastIndex = values.keys.max(),
                   maxOffset.value < UIScreen.main.bounds.width - 170 {
                    currentIndex = lastIndex
                    return
                }
                
                if let minOffset = values.min(by: { abs($0.value) < abs($1.value) }) {
                    currentIndex = minOffset.key
                }
            }
            .frame(height: 80)
            
        }
        .padding(.bottom, 23)
    }
    
    @ViewBuilder
    private var noticeSection: some View {
        HStack(alignment: .center, spacing: 0) {
            Text("공지")
                .font(.system(size: 11, weight: .semibold))
                .foregroundStyle(.gray2)
                .padding(.leading, 17)
            
            Text("티빙 계정 공유 정책 추가 안내")
                .font(.system(size: 11, weight: .semibold))
                .foregroundStyle(.gray1)
                .padding(.leading, 8)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .frame(width: 18, height: 18)
                .foregroundStyle(.white)
                .padding(.trailing, 18)
            
        }
        .frame(height: 50)
        .background(.gray4)
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .padding(.horizontal, 14)
        .padding(.bottom, 15)
        
    }
    
    @ViewBuilder
    private var etcSection: some View {
        VStack(alignment: .leading, spacing: 3) {
            HStack(alignment: .center, spacing: 3) {
                Text("고객문의")
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundStyle(.gray2)
                
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 2, height: 2)
                    .foregroundStyle(.gray2)
                
                Text("이용약관")
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundStyle(.gray2)
                
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 2, height: 2)
                    .foregroundStyle(.gray2)
                
                Text("개인정보처리방침")
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundStyle(.white)
            }
            
            HStack(alignment: .center, spacing: 3) {
                Text("사업자정보")
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundStyle(.gray2)
                
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 2, height: 2)
                    .foregroundStyle(.gray2)
                
                Text("인재채용")
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundStyle(.gray2)
            }
        }
        .padding(.horizontal, 20)
    }
}
