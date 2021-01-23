//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Xiang Liu on 1/21/21.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func style() -> some View {
        self.modifier(Title())
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .style()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
