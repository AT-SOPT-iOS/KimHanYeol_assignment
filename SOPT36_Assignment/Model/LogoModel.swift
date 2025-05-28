//
//  LogoModel.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 4/30/25.
//

import UIKit

struct LogoModel {
    let id: Int
    let posterImage: UIImage
}

extension LogoModel {
    static func dummy() -> [LogoModel] {
        return [
            LogoModel(id: 1, posterImage: .afcLogo),
            LogoModel(id: 2, posterImage: .kblLogo),
            LogoModel(id: 3, posterImage: .kboLogo),
            LogoModel(id: 4, posterImage: .appleTVLogo)
        ]
    }
}
