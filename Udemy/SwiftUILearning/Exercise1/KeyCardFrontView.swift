//
//  KeyCardFrontView.swift
//  SwiftUILearning
//
//  Created by xiang on 3/23/20.
//  Copyright © 2020 xiang. All rights reserved.
//

import SwiftUI

struct KeyCardFrontView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .background(Color.black)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                KeyFrontHeaderView()
                KeyFrontInfoView()
                    .frame(width: 330, alignment: .center)
                    .padding([.top], 20)
                    .padding([.bottom], 20)
                    .background(Color.white)
            }.cornerRadius(20)
            
        }
    }
}

struct KeyFrontHeaderView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 90) {
            
            KeyTopHoleView()
                .padding([.top], 30)
            Image("Xiang Liu")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .cornerRadius(150/2)
                .shadow(radius: 10)
            Spacer()
        }
            // order matters here
            .frame(width: 330, height: 400, alignment: .center)
            .background(Color.red)
    }
}

struct KeyFrontInfoView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            HStack {
                Text("Xiang")
                    .fontWeight(.black)
                    .font(.headline)
                Text("Liu")
                    .fontWeight(.light)
                    .font(.headline)
            }
            Text("iOS developer")
                .font(.subheadline)
            Spacer()
            HStack {
                Text("Your")
                    .font(.footnote)
                    .fontWeight(.bold)
                Text("Company")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundColor(Color.red)
            }
        }
    }
}

struct KeyTopHoleView: View {
    var body: some View {
        Rectangle()
            .frame(width: 125, height: 10)
            .foregroundColor(Color.gray)
            .cornerRadius(5)
    }
}

struct KeyCardFrontView_Previews: PreviewProvider {
    static var previews: some View {
        KeyCardFrontView()
    }
}

