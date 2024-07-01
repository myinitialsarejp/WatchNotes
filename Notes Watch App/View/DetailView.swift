//
//  DetailView.swift
//  Notes Watch App
//
//  Created by Jesse Pelletier on 6/22/24.
//

import SwiftUI

struct DetailView: View {
    
    // MARK: PROPERTIES
    let note: Note
    let count: Int
    let index: Int
    
    @State private var showCreditsView: Bool = false
    @State private var showSettingsView: Bool = false

    
    var body: some View {
        VStack(alignment: .center, spacing: 3){
            //HEADER
            HeaderView(title: "")
            //: HSTACK
            .foregroundColor(.accentColor)
            //CONTENT
            ScrollView(.vertical){
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            //FOOTER
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        showSettingsView.toggle()
                    }
                    .sheet(isPresented: $showSettingsView, content: {
                        Settings()
                    })
                Spacer()
                Text("\(count) / \(index+1)")
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        showCreditsView.toggle()
                    }
                    .sheet(isPresented: $showCreditsView, content: {
                        CreditsView()
                    })
            }//: HSTACK
            .foregroundColor(.secondary)
            //: VSTACK
        }
        .padding(3)
    }
}

// MARK: PREVIEW
var sampleData: Note = Note(id: UUID(), text: "Hello World!")
#Preview {
    DetailView(note: sampleData, count: 5, index: 1)
}
