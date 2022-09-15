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
                Text("SIMON:" )
                    .padding(1)
                    .font(.title)
                    .preferredColorScheme(.dark)
                Text("A game of short term memory and flashing lights.")
                    .padding(3)
                    .font(.subheadline)
                
                NavigationLink(destination: ContentView()) {
                    Label("PLAY", systemImage: "arrowtriangle.right.fill")
                }
            }
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
