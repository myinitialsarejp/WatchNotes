//
//  CreditsView.swift
//  Notes Watch App
//
//  Created by Jesse Pelletier on 6/22/24.
//

import SwiftUI

struct CreditsView: View {
    //PROPERTIES
    @State private var randomNumber: Int = Int.random(in: 1..<4)
    private var randomImage: String {
        return "developer-no\(randomNumber)"
    }
    //BODY
    var body: some View {
        VStack(spacing:3){
            //PROFILE IMAGE
            Image(randomImage)
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            //HEADER
            HeaderView(title: "Credits")
            //CONTENT
            Text("Jesse Pelletier")
                .foregroundColor(.primary)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text("Developer")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)
        }//: VSTACK
    }
}

//PREVIEW

#Preview {
    CreditsView()
}
