//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Dieter Bergmann on 27.12.23.
//

import SwiftUI

struct ContentView: View {
    @State private var messageString = "When the Genius Bar needs help, they call you!"
    
    var body: some View {
        GeometryReader { geometry in
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
        //                .border(.orange, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                        .padding()
                    
                    Spacer()
                    
                    Divider()
                        .background(.black)
                        .padding()
                        .frame(width: 150.0)
                    
                    Rectangle()
                        .fill(.indigo)
                        .frame(width: geometry.size.width * (2/3), height: 1)
                    
                    HStack {
                        Button("Awesome") {
                            // This is the action
                            messageString = "Your Are Awsome!"
                        }
                        .buttonStyle(.borderedProminent)
                        
                        Spacer()
                        
                        Button("Great") {
                            messageString = "Great!"
                        }
                        .buttonStyle(.borderedProminent)
                    }
        //            .border(.purple, width: 5)
                    .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
