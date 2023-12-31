//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Dieter Bergmann on 27.12.23.
//

import SwiftUI

struct ContentView: View {
    @State private var messageString = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(messageString)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .foregroundStyle(Color.red)
                .frame(height: 150)
                .frame(maxWidth: .infinity)
                .padding()
            
            Spacer()
            
            Button("Show Message") {
                let message1 = "You are Awesome !"
                let message2 = "You Are Great !"
                
                // This is the action
//                if messageString == message1 {
//                   messageString = message2
//                } else {
//                    messageString = message1
//                }
                
                messageString = (messageString == message1 ? message2 : message1)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
