//
//  Settings.swift
//  Notes Watch App
//
//  Created by Jesse Pelletier on 7/1/24.
//

import SwiftUI

struct Settings: View {
    // PROPERTIES
    @AppStorage("lineCount") var lineCount: Int = 1
    @State private var value: Float = 1.0
    
    // FUNCTIONS
    func Update(){
        lineCount = Int(value)
    }
    // BODY
    var body: some View {
        VStack(spacing: 8){
            // HEADER
            HeaderView(title: "Settings")
            // LINE COUNT
            Text("Lines: \(lineCount)".uppercased())
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Slider(value: Binding(get: {self.value}, set: {(newValue) in self.value = newValue
                self.Update()
            }), in: 1...4, step: 1)
                .accentColor(.accentColor)
            // SLIDER
        } //: VSTACK
    }
}

#Preview {
    Settings()
}
