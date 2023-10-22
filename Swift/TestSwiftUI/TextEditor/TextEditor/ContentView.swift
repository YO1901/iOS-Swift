//
//  ContentView.swift
//  TextEditor
//
//  Created by Yerlan Omarov on 08.07.2022.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = "*Initial* text"
    weak var textView: UITextView!
    
    var body: some View {
        ZStack {
            TextEditor(text: $text).foregroundColor(.clear).background(Color.clear)
            Text(text)
        }
        .frame(alignment: .topLeading)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
