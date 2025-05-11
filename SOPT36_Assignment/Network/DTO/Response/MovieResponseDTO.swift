//
//  MovieResponseDTO.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 5/11/25.
//

struct MovieResponseDTO: Codable {
    let boxOfficeResult: BoxOfficeResult
}

struct BoxOfficeResult: Codable {
    let dailyBoxOfficeList: [DailyBoxOffice]
}

struct DailyBoxOffice: Codable {
    let rank: String
    let movieNm: String
    let openDt: String
    let audiCnt: String
    let audiAcc: String
}
