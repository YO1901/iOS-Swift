//
//  NetworkNewsManager.swift
//  JustNews
//
//  Created by Omarov Yerlan on 20.08.2021.
//

import Foundation

struct NetworkNewsManager {
    func fetchCurrentNews(completion: @escaping (Result<[Article], Error>) -> Void) {
        let urlString =
            "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(apiKey)"
        let url = URL(string: urlString)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url!) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    print("Articles: \(result.articles.count)")
                    completion(.success(result.articles))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}

struct APIResponse: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String
}

struct Source: Codable {
    let id: String?
    let name: String
}
