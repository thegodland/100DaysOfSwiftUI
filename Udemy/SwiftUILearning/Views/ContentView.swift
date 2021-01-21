//
//  ContentView.swift
//  SwiftUILearning
//
//  Created by xiang on 3/23/20.
//  Copyright © 2020 xiang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CardImageView()
            List {
                VideoRow()
                VideoRow()
                AudioBookCell()
            }
        }

    }
}

struct AudioBookCell: View {
    var body: some View {
        VStack {
            Image("corona")
                .resizable()
                .aspectRatio(contentMode: .fit)
            ProgressView(progressPercent: 0.2)
        }
        .frame(width: 200)
    }
}

struct ProgressView: View {
    var progressPercent = 1.0
    var body: some View {
        ZStack {
            GeometryReader { geo in
                Rectangle()
                .fill(Color.gray)
                .frame(height: 5)
                Rectangle()
                .fill(Color.red)
                    .frame(width: geo.size.width * CGFloat(self.progressPercent), height: 5)
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
