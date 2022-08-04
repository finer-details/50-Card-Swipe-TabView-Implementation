//
//  ContentView.swift
//  Card_Swipe_Tab_Modifier_M4_L7
//
//  Created by David Devlin on 04/08/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        GeometryReader { geo in
            
            TabView {
                
                ForEach (1..<51) { index in
                    
                    ZStack {
                        Rectangle()
                            .frame(width: geo.size.width - 30, height: geo.size.height - 100, alignment: .center)
                        
                            .cornerRadius(20)
                            .shadow(color: (Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.6)), radius: 10, x: -5, y: 5)
                        //Generate a new colour with each swipe
                            .foregroundColor(Color(.sRGB, red: (Double.random(in: 0..<1)), green: (Double.random(in: 0..<1)), blue: (Double.random(in: 0..<1)), opacity: 1))
                        
                        Text("Starter Project")
                            .padding()
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
