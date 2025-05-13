//
//  BoxOfficeService.swift
//  Tving
//
//  Created by 임재현 on 5/13/25.
//

import Foundation

class BoxOfficeService {

    static let shared = BoxOfficeService()
    private init() {}

    private func makeRequest(date : String?) -> URLRequest? {
        var urlString = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json"

        urlString += "?key=86826478e2d6d0e4edd635e10017dabf"

        if let date = date, !date.isEmpty,
           let encoded = date.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            urlString += "&targetDt=\(date)"
        }

        guard let url = URL(string: urlString) else { return nil }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }

    func fetchBoxOffice(date: String?) async throws -> [MovieInfo] {
        guard let request = makeRequest(date: date) else {
            throw NetworkError.requestEncodingError
        }

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.responseError
        }

        do {
            let decoded = try JSONDecoder().decode(BoxOfficeResponseDTO.self, from: data)
            let movieInfo = decoded.boxOfficeResult.dailyBoxOfficeList.map { data in
                MovieInfo(
                    rank: data.rank,
                    title: data.movieNm,
                    openDate: data.openDt
                )
            }
            return movieInfo
        } catch {
            print("디코딩 실패:", error)
            throw NetworkError.responseDecodingError
        }
    }
}
