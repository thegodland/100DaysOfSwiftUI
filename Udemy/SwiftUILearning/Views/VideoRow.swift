//
//  VideoRow.swift
//  SwiftUILearning
//
//  Created by xiang on 3/23/20.
//  Copyright © 2020 xiang. All rights reserved.
//

import SwiftUI

struct VideoRow: View {
    var body: some View {
        HStack(alignment: .top) {
            Image("corona")
                .resizable()
                .frame(width: 80, height: 80)
            VStack(alignment: .leading) {
                Text("How to fight with corona")
                    .font(.headline)
                    .fontWeight(.black)
                Text("Placeholder")
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                Spacer()
            }
            Spacer()
        }
    }
}

struct VideoRow_Previews: PreviewProvider {
    static var previews: some View {
        VideoRow()
    }
}
