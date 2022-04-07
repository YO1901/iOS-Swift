//
//  NetworkService.swift
//  TagCloud
//
//  Created by Yerlan Omarov on 07.04.2022.
//

import Alamofire

protocol DataProviderProtocol {
    func fetchAllAlcohol(_ completion: @escaping (ModelData) -> ())
}

class NetworkService {
    let url = "https://www.thecocktaildb.com/api/json/v1/1/filter.php"
    let alcoholType = "Non_Alcoholic"
}

extension NetworkService: DataProviderProtocol {
    func fetchAllAlcohol(_ completion: @escaping (ModelData) -> ()) {
        let queue = DispatchQueue(label: "getRequest",
                                  qos: .utility,
                                  attributes: [.concurrent])
        
        let parameters = ["a": alcoholType]
        AF.request(url, method: .get, parameters: parameters).validate().responseDecodable(
            of: ModelData.self,
            queue: queue,
            completionHandler: { data in
                DispatchQueue.main.async {
                    switch data.result {
                    case .success(let result):
                        completion(result)
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        )
    }
}
