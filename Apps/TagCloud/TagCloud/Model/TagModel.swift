//
//  TagModel.swift
//  TagCloud
//
//  Created by Yerlan Omarov on 05.04.2022.
//

import Foundation

struct ModelData: Codable {
    let drinks: [TagModel]
}

struct TagModel: Codable {
    let strDrink: String
}
