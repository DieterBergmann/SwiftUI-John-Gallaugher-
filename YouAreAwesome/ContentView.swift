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
    @State private var lastMessageNumber = -1
    @State private var imageName = ""
    @State private var imageNumber = 0
    @State private var lastImageNumber = -1
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

                lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperBound: messages.count-1)
                messageString = messages[lastMessageNumber]
                
                lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBound: 9)
                imageName = "image\(lastImageNumber)"
                lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBound: 5)

                playSound(soundName: "sound\(lastSoundNumber)")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
    
    func playSound(soundName: String) {
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
    
    func nonRepeatingRandom(lastNumber: Int, upperBound: Int) -> Int {
        var newNumber: Int
        
        repeat {
            newNumber = Int.random(in: 0...upperBound)
        } while newNumber == lastNumber
        
        return newNumber
    }
}

#Preview {
    ContentView()
}
