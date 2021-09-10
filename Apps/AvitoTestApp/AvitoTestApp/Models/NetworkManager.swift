//
//  DataCaller.swift
//  AvitoTestApp
//
//  Created by Omarov Yerlan on 08.09.2021.
//

import Foundation

final class NetworkManager {
  public func getEmployeeList(completion: @escaping (Result<Companies, Error>) -> Void) {
    guard let url = dataURL else {
      return
    }
 
    let decoder = JSONDecoder()
    let session = URLSession(configuration: .default)
    let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                } else if let data = data {
                    do {
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let result = try decoder.decode(NetworkResponse.self, from: data)
                        completion(.success(result.company))
                    } catch {
                        completion(.failure(error))
                    }
                }
            }
            task.resume()
  }
  
}

struct NetworkResponse: Codable {
  let company: Companies
}

struct Companies: Codable {
  let name: String
  let employees: [Employees]
}

struct Employees: Codable {
  let name: String
  let phoneNumber: String
  let skills: [String]
}
