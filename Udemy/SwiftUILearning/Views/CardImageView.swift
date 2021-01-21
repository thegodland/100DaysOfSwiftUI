//
//  CardImageView.swift
//  SwiftUILearning
//
//  Created by xiang on 3/23/20.
//  Copyright © 2020 xiang. All rights reserved.
//

import SwiftUI

struct CardImageView: View {
    var body: some View {
        Image("corona")
            .resizable()
            .aspectRatio(CGSize(width: 1.5, height: 1.0), contentMode: .fit)
            .cornerRadius(10)
            .padding(10)
            .shadow(radius: 5)
    }
}

struct CardImageView_Previews: PreviewProvider {
    static var previews: some View {
        CardImageView()
    }
}
