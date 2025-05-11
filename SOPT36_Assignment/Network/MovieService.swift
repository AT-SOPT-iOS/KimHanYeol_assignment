//
//  MovieService.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 5/11/25.
//

import UIKit

final class MovieService {
    static let shared = MovieService()
    private init() {}
    
    func makeRequest() -> URLRequest? {
        var urlString = EnvironmentEnum.BASE_URL
        var key = EnvironmentEnum.API_KEY
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        
        urlString += "\(key)&targetDt=20120101"
        
        guard let url = URL(string: urlString) else {return nil}
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    func fetchMovieRankList() async throws -> BoxOfficeResult {
        guard let request = makeRequest() else {
            throw NetworkError.requestEncodingError
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.responseError
        }
        do {
            let decoded = try JSONDecoder().decode(MovieResponseDTO.self, from: data)
            return decoded.boxOfficeResult
        } catch {
            print("디코딩 실패:", error)
            throw NetworkError.responseDecodingError
        }
    }
    
}
