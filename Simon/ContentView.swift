//
//  ContentView.swift
//  Simon
//
//  Created by Victor Gunderson on 9/12/22.
//

import SwiftUI

struct ContentView: View {
    @State private var colorDisplay = [ColorDisplay(color: .green), ColorDisplay(color: .red), ColorDisplay(color: .yellow), ColorDisplay(color: .blue)]
    var body: some View {
        VStack {
            Text("Simon")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .preferredColorScheme(.dark)
            Spacer()
            
            HStack {
                colorDisplay[0]
                colorDisplay[1]
            } .multilineTextAlignment(.center)
            HStack {
                colorDisplay[2]
                colorDisplay[3]
            } .multilineTextAlignment(.center)
            Spacer()
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
