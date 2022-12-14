//
//  ContentView.swift
//  Card_Swipe_Tab_Modifier_M4_L7
//
//  Created by David Devlin on 04/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var number = 1
    
    @ObservedObject var array = ArrayLogic()
  
//    @State var circleIsFill = false
    
    private func randomElementCircle() -> String {
        let collection = array.circleTypeArray
        return collection[Int.random(in: 0..<collection.count)]
    }
    
//    private func circleType() -> Bool {
//            if randomElementCircle() == "circle.fill" {
//                circleIsFill = true
//            } else if randomElementCircle() != "circle.fill" {
//                circleIsFill = false
//            }
//        return circleIsFill
//    }
    
    
    var body: some View {
        
        GeometryReader { geo in
            
            TabView(selection: $number) {
                
                ForEach (1..<52) { index in
                    
                    ZStack {
                        Rectangle()
                            .frame(width: geo.size.width - 30, height: geo.size.height - 100, alignment: .center)
                        
                            .cornerRadius(20)
                            .shadow(color: (Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.6)), radius: 10, x: -5, y: 5)
                        //Generate a new colour with each swipe
                            .foregroundColor(Color(.sRGB, red: (Double.random(in: 0..<1)), green: (Double.random(in: 0..<1)), blue: (Double.random(in: 0..<1)), opacity: 1))
                        
                        ZStack {
                            //creates a random circle boarder
                            Image(systemName: randomElementCircle())
                                .font(.custom("Avenir-Book", size: 330, relativeTo: .body))

                            Text("\(number)")
                                .font(.custom("ArialRoundedMTBold", size: 200, relativeTo: .largeTitle))
                            //makes white font color if circle.fill selected
//                                .foregroundColor( circleType() ? .white : .black)
                                .foregroundColor(.white)
                        }
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
