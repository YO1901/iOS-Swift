//
//  ContentView.swift
//  TestSUIRendering
//
//  Created by Yerlan Omarov on 17.11.2022.
//

import SwiftUI

struct Item: Identifiable {
    var id: Int
    var name: String { String(id) }
    var height: CGFloat
}

class ItemViewModel: ObservableObject {
    @Published var item: Item
    var on: Bool = false
    
    init(item: Item) {
        self.item = item
        if item.id == 10 {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                self.item.height = self.on ? 120 : 60
                self.on.toggle()
            }
        }
    }
}

class Model: ObservableObject {
    
    @Published var items: [Item] = (0 ..< 100).map { i in
        Item(id: i, height: 60)
    }
    
}

struct ItemView: View {
    @StateObject var itemViewModel: ItemViewModel
    var body: some View {
        Text(itemViewModel.item.name)
            .frame(height: itemViewModel.item.height)
            .border(Color.blue)
    }
}

struct ContentView: View {
    private var model = Model()
    var body: some View {
        NavigationView {
            List {
                ForEach(model.items) { item in
                    ItemView(itemViewModel: ItemViewModel(item: item))
                }
            }
        }
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

