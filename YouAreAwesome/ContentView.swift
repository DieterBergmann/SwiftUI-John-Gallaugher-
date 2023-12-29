//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Dieter Bergmann on 27.12.23.
//

import SwiftUI

struct ContentView: View {
    @State private var messageString = "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk"
    
    var body: some View {
        VStack {
            Text(messageString)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .foregroundStyle(Color.red)
                .frame(height: 150)
                .frame(maxWidth: .infinity)
                .border(.orange, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .padding()
            
            HStack {
                Button("Awesome") {
                    // This is the action
                    messageString = "Your Are Awsome!"
                }
                .buttonStyle(.borderedProminent)
                
                Button("Great") {
                    messageString = "Great!"
                }
                .buttonStyle(.borderedProminent)
            }
            .border(.purple, width: 5)
        }
    }
}

#Preview {
    ContentView()
}
