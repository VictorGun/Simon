//
//  ContentView.swift
//  Simon
//
//  Created by Victor Gunderson on 9/12/22.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var colorDisplay = [ColorDisplay(color: .green), ColorDisplay(color: .red), ColorDisplay(color: .yellow), ColorDisplay(color: .blue)]
    @State private var flash = [false, false, false, false]
    @State private var timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    @State private var index = 0
    @State private var sequence = [Int]()
    @State private var rounds = 1...1000
    @State private var tapGet = -1
    @State private var userPlaying = false
    @State private var hasLost = false
    @State private var sequenceLocation = -1
    @State private var titleText = "Simon"
    @State private var audioPlayer: AVAudioPlayer!
    
    var body: some View {
        VStack {
            
            Text(titleText)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .preferredColorScheme(.dark)
            //game loop, this part is where simon is giving you the sequence
                .onReceive(timer) { _ in
                    if index < sequence.count {
                        flashColorDisplay(index: sequence[index])
                        index += 1
                    }
                    else  {
                        Task {
                            userPlaying = true
                            timer.upstream.connect().cancel()
                            await userInput()
                            if(hasLost) {
                                
                            } else {
                                index = 0
                                sequence.append(Int.random(in: 0...3))
                            }
                            
                        }
                    }
                }
            
            Text("Current Simon sequence length: \(sequence.count)")
            if(sequenceLocation >= 0) {
                Text("Current position in the sequence: \(sequenceLocation)")
            }
            Spacer()
            
            HStack {
                colorDisplay[0]
                    .opacity(flash[0] ? 1 : 0.4)
                    .onTapGesture {
                        flashColorDisplay(index: 0)
                        tapGet = 0
                        buttonGo()
                    }
                colorDisplay[1]
                    .opacity(flash[1] ? 1 : 0.4)
                    .onTapGesture {
                        flashColorDisplay(index: 1)
                        tapGet = 1
                        buttonGo()
                    }
            }
            HStack {
                colorDisplay[2]
                    .opacity(flash[2] ? 1 : 0.4)
                    .onTapGesture {
                        flashColorDisplay(index: 2)
                        tapGet = 2
                        buttonGo()
                    }
                colorDisplay[3]
                    .opacity(flash[3] ? 1 : 0.4)
                    .onTapGesture {
                        flashColorDisplay(index: 3)
                        tapGet = 3
                        buttonGo()
                    }
            }
            Spacer()
            
            
            
            Button("Restart") {
                timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
                index = 0
                sequence = [Int]()
                rounds = 1...1000
                tapGet = -1
                userPlaying = false
                hasLost = false
                sequenceLocation = -1
                titleText = "Simon"
            }.font(.title3)
                .foregroundColor(.black)
                .padding(5)
                .background(.gray)
                .cornerRadius(5.0)
            
            
            Spacer()
        }
        
    }

    //gonna just call it a bunch
    //actually does stuff when you hit buttons
    func buttonGo() {
        if(userPlaying) {
            sequenceLocation += 1
            if(sequenceLocation < sequence.count) {
                if(sequence[sequenceLocation] != tapGet) {
                    hasLost = true
                }
            }
        }
    }
    func playSound(sound : String) {
        //  code goes here //
        let url = Bundle.main.url(forResource: sound, withExtension: "mp3")
        
        guard url != nil else {
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url!)
            player?.play()
        } catch {
            print("\(error)")
        }
        
        // --------------- //
    }
    
    //USE OF THE PLAY SOUNDS playSounds("file.(mp3)(wav)(etc) (remove brackets")
    
    
    //I hate async, so I'm gonna do it.
    //player just like hits button in the sequence
    //this might be a bit too big of a function, might wanna split it
    func userInput() async {
        titleText = "Start Playing"
        let playerTime = 1000000000
        if(sequence.count > 0) {
            let loopCount = 1...sequence.count
            
            for _ in loopCount {
                if(hasLost) {
                    break
                } else {
                    try? await Task.sleep(nanoseconds: UInt64(playerTime) )
                }
            }
        }
        
        
        userPlaying = false
        
        if(hasLost || sequenceLocation != sequence.count - 1) {
            titleText = "You Lost"
            
        } else {
            timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
            tapGet = -1
            sequenceLocation = -1
            
            titleText = "Simon"
        }
        
        
        
    }
    func flashColorDisplay(index: Int) {
        flash[index].toggle()
        withAnimation(.easeInOut(duration: 0.5)) {
            flash[index].toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct ColorDisplay: View {
    let color: Color
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .fill(color)
            .frame(width: 100, height: 100, alignment: .center)
            .padding()
    }
}
