//
//  InstructionsView.swift
//  Simon
//
//  Created by Leo Lai on 9/26/22.
//

import SwiftUI

struct InstructionsView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("HOW TO PLAY")
                .font(Font.custom("impact", size: 50))
            Text("""
• Simon will give the first signal. (One of the colored buttons will light up, accompanied by a tone.)

• Repeat that signal by touching the same colored buttons.

• Simon will repeat the first signal and then add one more.

• Repeat those two signals in the same order.

• Simon will continue to play the sequence and add one.

Continue to repeat Simon for as long as you can!
""") .font(Font.custom("impact", size: 18))
            .preferredColorScheme(.dark)
            .padding(5)
            Spacer()
            NavigationLink(destination: VictoryView()) {
                Text("Next: Winning Or Losing")
            }.foregroundColor(.blue).font(.title3)
            Spacer()
        }
    }
}

struct VictoryView: View {
    var body: some View {
        VStack {
            Text("VICTORY: INVICTUS")
                .font(Font.custom("imapct", size: 18))
                .padding(20)
            Text("""
• If you fail to complete the sequence in the correct order or within the time limit, the Buzzer will sound and the game will end.

• If you want, you can see your score above the play area. It will update in real time!

• Simon records your High Score during a session so you can play to beat it.

""")
            .font(Font.custom("impact", size: 18))
        }
    }
}

struct InstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsView()
    }
}
