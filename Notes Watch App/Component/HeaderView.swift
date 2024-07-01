//
//  HeaderView.swift
//  Notes Watch App
//
//  Created by Jesse Pelletier on 6/22/24.
//

import SwiftUI

struct HeaderView: View {
    var title: String = ""
    var body: some View {
        VStack {
            //TITLE
            if title != "" {
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.accentColor)
            }
            //SEPARATOR
            HStack{
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")
                
                Capsule()
                    .frame(height: 1)
            }
        }//: VSTACK
    }
}

#Preview("No Title Header") {
    HeaderView()
}

#Preview("Titled Header") {
    HeaderView(title: "Credits")
}
