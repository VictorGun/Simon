//
//  ContentView.swift
//  Simon
//
//  Created by Victor Gunderson on 9/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Simon")
                .font(.title)
                .multilineTextAlignment(.center)
            .preferredColorScheme(.dark)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
