//
//  BaseballModel.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 4/30/25.
//

import UIKit

struct BaseballModel {
    let id: Int
    let posterImage: UIImage
    let backgroundColor: UIColor
}

extension BaseballModel {
    static func dummy() -> [BaseballModel] {
        return [
            BaseballModel(id: 1, posterImage: .baseball1, backgroundColor: .white),
            BaseballModel(id: 2, posterImage: .baseball2, backgroundColor: .black),
            BaseballModel(id: 3, posterImage: .baseball3, backgroundColor: .white),
            BaseballModel(id: 4, posterImage: .baseball4, backgroundColor: .black),
            BaseballModel(id: 5, posterImage: .baseball5, backgroundColor: .white)
        ]
    }
}
