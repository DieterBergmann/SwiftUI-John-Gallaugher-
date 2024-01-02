//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Dieter Bergmann on 27.12.23.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var messageString = ""
    @State private var messageNumber = 0
    @State private var imageName = ""
    @State private var imageNumber = 0
    @State private var audioPlayer: AVAudioPlayer!
    @State private var lastSoundNumber = -1

    
    let message = ["", "Hey, how are You?", "I'm fine thank You!", "How are You?", "Fine thank You!"]
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(30)
                .shadow(radius: 30)
                .padding()
            
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
                let messages = ["Hey, how are You?",
                               "I'm fine thank You!",
                               "How are You?",
                               "Fine thank You!"]

                messageString = messages[messageNumber]                
                messageNumber = Int.random(in: 0...messages.count-1)
                
                if messageNumber == messages.count {
                    messageNumber = 0
                }
                
                imageName = "image\(imageNumber)"
                
                imageNumber = Int.random(in: 0...9)
                if imageNumber > 9 {
                    imageNumber = 0
                }
                
                var soundNumber: Int
                repeat {
                    soundNumber = Int.random(in: 0...5)
                } while soundNumber == lastSoundNumber
                lastSoundNumber = soundNumber
                let soundName = "sound\(soundNumber)"
                
                guard let soundFile = NSDataAsset(name: soundName) else {
                    print("Could not find \(soundName)")
                    return
                }
                
                do {
                    audioPlayer = try AVAudioPlayer(data: soundFile.data)
                    audioPlayer.play()
                } catch {
                    print("ERROR: \(error.localizedDescription) creatin audioPlayer.")
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
