//
//  TitleView.swift
//  Simon
//
//  Created by Leo Lai on 9/15/22.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("SIMON:" )
                    .padding(1)
                    .font(Font.custom("impact", size: 40))
                    .preferredColorScheme(.dark)
                Text("A game of short term memory and flashing lights.")
                    .padding(3)
                    .font(Font.custom("impact", size: 18))
                
                NavigationLink(destination: ContentView()) {
                    Label("PLAY", systemImage: "arrowtriangle.right.fill")
                        .font(Font.custom("impact", size: 20))
                }
                Spacer()
                NavigationLink(destination: InstructionsView()) {
                    Text("Instructions")
                }.padding(20).font(Font.custom("impact", size: 20))
                
            }
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
