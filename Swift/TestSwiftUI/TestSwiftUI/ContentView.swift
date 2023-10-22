//
//  ContentView.swift
//  TestSwiftUI
//
//  Created by Yerlan Omarov on 01.07.2022.
//

import SwiftUI

class MiniModel: ObservableObject {
    @Published var items: [Item] = [.init(string: "0"), .init(string: "2"), .init(string: "3")]
}

struct Item: Identifiable, Hashable {
    let id = UUID()
    var string: String
}

struct TesticView: View {
    @StateObject private var miniModel = MiniModel()
    var body: some View {
        VStack(spacing: 20) {
            Button("add") {
                withAnimation {
                    let temp = miniModel.items[0]
                    miniModel.items[0] = miniModel.items[2]
                    miniModel.items[2] = temp
                    miniModel.items.append(.init(string: String(miniModel.items.count)))
                }
            }
            // 1
            ForEach(miniModel.items) { item in
            
            // 2
//            ForEach(0 ..< miniModel.items.count, id: \.self) { i in
//                let item = miniModel.items[i]
            //3
//            ForEach(miniModel.items.indices, id: \.self) { i in
//                let item = miniModel.items[i]
                Text(item.string)
            }
            Spacer()
        }
    }
}

struct ContentView: View {
    var body: some View {
        TesticView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
