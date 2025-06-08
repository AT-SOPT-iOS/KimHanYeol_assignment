//
//  TvingHeader.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 6/3/25.
//

import SwiftUI

struct TvingHeader: View {
    var body: some View {
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
    }
}
