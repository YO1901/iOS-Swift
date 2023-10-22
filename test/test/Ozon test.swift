//
//  Ozon test.swift
//  test
//
//  Created by Yerlan Omarov on 04.09.2023.
//

import Foundation
import SwiftUI

struct ContentItem: Decodable {
    let company_name: String

    static let test = [
        ContentItem(company_name: "Ozon"),
        ContentItem(company_name: "Yandex"),
        ContentItem(company_name: "Wildberries")
    ]

    static func loadData(callback: @escaping ([ContentItem]?, Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            ﻿DispatchQueue.global(qos: .background).async {
                let products: [ContentItem] = ContentItem(company_name: "loading") // ...get products from data
                callback(products, nil)
            }
        }
    }
}

struct ContentItemView: View {
    let item: ContentItem

    var body: some View {
        Text(item.company_name)
    }
}

struct ContentView: View {

    @State private var inputSearchText: String = ""
    @State private var outputItems: [ContentItem] = []

    var body: some View {
        VStack {
            TextField("search", text: $inputSearchText)
                .padding()
            List {
                ForEach(Array(outputItems.enumerated()), id: \.offset) { index, item in

                    ContentItemView(item: item)
                }
            }.listStyle(.inset)
        }.onChange(of: inputSearchText) { newValue in

            ContentItem.loadData { items, error in
                outputItems = items?.filter {
                    $0.company_name.contains(newValue)
                } ?? []
            }

        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(outputItems: ContentItem.test)
//    }
//}

