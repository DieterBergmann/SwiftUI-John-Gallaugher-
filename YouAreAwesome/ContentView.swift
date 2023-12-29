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
        ZStack {
            Rectangle()
                .fill(.yellow.gradient)
                .ignoresSafeArea()
            
            VStack {
                Text("You Have Skills!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(Color("Gold-BC"))
                    .padding()
                    .background(Color("Maroon-BC"))
                    .cornerRadius(15)
                
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
