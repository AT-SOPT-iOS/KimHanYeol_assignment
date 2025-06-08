//
//  posterModel.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 4/30/25.
//

import UIKit

struct PosterModel {
    let id: Int
    let posterImage: UIImage
    let title: String
    let description: String
}

extension PosterModel {
    static func dummy() -> [PosterModel] {
        return [
            PosterModel(id: 1, posterImage: .posterImage1, title: "너에게 닿기를", description: ""),
            PosterModel(id: 2, posterImage: .posterImage2, title: "시그널", description: ""),
            PosterModel(id: 3, posterImage: .posterImage3, title: "해리포터", description: ""),
            PosterModel(id: 4, posterImage: .posterImage4, title: "스즈메의 문단속", description: ""),
            PosterModel(id: 5, posterImage: .posterImage5, title: "너의 이름은", description: ""),
            PosterModel(id: 6, posterImage: .posterImage6, title: "슬기로운 전공의생활", description: ""),
            PosterModel(id: 7, posterImage: .posterImage7, title: "반지의 제왕", description: "")
        ]
    }
}
