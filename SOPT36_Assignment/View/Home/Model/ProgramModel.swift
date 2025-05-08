//
//  programModel.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 4/30/25.
//

import UIKit

struct ProgramModel {
    let id: Int
    let posterImage: UIImage
    let title: String
    let description: String
    let rating: String
}

extension ProgramModel {
    static func dummy() -> [ProgramModel] {
        return [
            ProgramModel(id: 1, posterImage: .longPoster1, title: "별들에게 물어봐", description: "별들에게 물어봐 1화", rating: "11.1%"),
            ProgramModel(id: 2, posterImage: .longPoster2, title: "선재업고 튀어", description: "선재업고 튀어 2화", rating: "22.2%"),
            ProgramModel(id: 3, posterImage: .longPoster3, title: "환승 연애", description: "환승 연애 3화", rating: "33.3%"),
            ProgramModel(id: 4, posterImage: .longPoster4, title: "지구오락실", description: "지구오락실 4화", rating: "44.4%"),
            ProgramModel(id: 5, posterImage: .longPoster5, title: "전공의생활", description: "전공의생활 5화", rating: "55.5%"),
            ProgramModel(id: 6, posterImage: .longPoster6, title: "이혼보험", description: "이혼보험 6화", rating: "66.6%")
        ]
    }
}
