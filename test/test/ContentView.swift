//
//  ContentView.swift
//  test
//
//  Created by Yerlan Omarov on 17.05.2023.
//

import SwiftUI

class OModel1: ObservableObject {
    @Published var param = 1
    init(param: Int) {
        print("--- OModel1 init \(param)")
        self.param = param
    }
    deinit {
        print("††† OModel1 deinit")
    }
}

class OModel2: ObservableObject {
    @Published var param = 1
    init(param: Int) {
        print("--- OModel2 init \(param)")
        self.param = param
    }
    deinit {
        print("††† OModel2 deinit")
    }
}

class SModel1: ObservableObject {
    @Published var param = 1
    init(param: Int) {
        print("--- SModel1 init \(param)")
        self.param = param
    }
    deinit {
        print("††† SModel1 deinit")
    }
}

class SModel2: ObservableObject {
    @Published var param = 1
    init(param: Int) {
        print("--- SModel2 init \(param)")
        self.param = param
    }
    deinit {
        print("††† SModel2 deinit")
    }
}

struct OView1: View {
    @ObservedObject var model: OModel1
    init(model: OModel1) {
        print("OView1 init \(model.param)")
        _model = ObservedObject(wrappedValue: model)
    }
    var body: some View {
        print("OView1 body")
        return Text("OView1 body \(model.param)")
    }
}

struct OView2: View {
    @ObservedObject var model: OModel2
    init(param: Int) {
        print("OView2 init \(param)")
        _model = ObservedObject(wrappedValue: OModel2(param: param))
    }
    var body: some View {
        print("OView2 body")
        return Text("OView2 body \(model.param)")
    }
}

struct SView1: View {
    @StateObject var model: SModel1
    init(model: SModel1) {
        print("SView1 init \(model.param)")
        _model = StateObject(wrappedValue: model)
    }
    var body: some View {
        print("SView1 body")
        return Text("SView1 body \(model.param)")
    }
}

struct SView2: View {
    @StateObject var model: SModel2
    init(param: Int) {
        print("SView2 init \(param)")
        _model = StateObject(wrappedValue: SModel2(param: param))
    }
    var body: some View {
        print("SView2 body")
        return Text("SView2 body \(model.param)")
    }
}

struct ContentView: View {
    @State private var param = 1
    
    var body: some View {
        print("ContentView body")
        return VStack {
            Button("Tap me") { param += 1 }
            OView1(model: OModel1(param: param)).padding()
            OView2(param: param).padding()
            SView1(model: SModel1(param: param)).padding()
            SView2(param: param).padding()
        }
    }
}

@main
struct SUI8App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
