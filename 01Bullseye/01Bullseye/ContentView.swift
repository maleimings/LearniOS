//
//  ContentView.swift
//  01Bullseye
//
//  Created by Valiant on 2020/4/22.
//  Copyright © 2020 Valiant. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    private let fullScore = 100
    
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50.0
    @State var target: Int = 0
    @State var score = 0
    @State var round = 0
    
    var body: some View {
        
        VStack {
            Spacer()

            HStack {
                Text("Put the bullseye as close as you can to:")
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
                .foregroundColor(Color.white)
                .shadow(color: Color.black, radius: 5, x: 2, y: 2)
                Text("\(self.target)")
                .font(Font.custom("Arial Rounded MT Bold", size: 24))
                .foregroundColor(Color.yellow)
                .shadow(color: Color.black, radius: 5, x: 2, y: 2)
            }
            Spacer()
            
            HStack {
                Text("1")
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
                .foregroundColor(Color.white)
                .shadow(color: Color.black, radius: 5, x: 2, y: 2)
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100")
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
                .foregroundColor(Color.white)
                .shadow(color: Color.black, radius: 5, x: 2, y: 2)
            }
            Spacer()

            Button(action: {
                self.alertIsVisible = true
                self.round = self.round + 1

                self.target = self.generateRandomTarget()
            }) {
                Text("Hit me!")
            }
            .background(Image("Button"))
            .shadow(color: Color.black, radius: 5, x: 2, y: 2)
            .alert(isPresented: self.$alertIsVisible) {
                Alert(title: Text(getTitle()),
                      message: Text(getScoredMessage()),
                      dismissButton: .default(Text("Awesome!")){
                        self.score = self.score + self.pointsForCurrentRound()
                    })
            }
            Spacer()

            
            //score row
            HStack {
                Button(action: {
                    self.score = 0
                    self.round = 0
                }) {
                    Text("Start Over")
                }
                .background(Image("Button"))
                Spacer()
                
                Text("Score:")
                .font(Font.custom("Arial Rounded MT Bold", size: 18)) .foregroundColor(Color.white)
                .shadow(color: Color.black, radius: 5, x: 2, y: 2)
                Text("\(self.score)")
                .font(Font.custom("Arial Rounded MT Bold", size: 24)) .foregroundColor(Color.yellow)
                .shadow(color: Color.black, radius: 5, x: 2, y: 2)
                Spacer()

                Text("Round:")
                .font(Font.custom("Arial Rounded MT Bold", size: 18)) .foregroundColor(Color.white)
                .shadow(color: Color.black, radius: 5, x: 2, y: 2)
                Text("\(self.round)")
                .font(Font.custom("Arial Rounded MT Bold", size: 24)) .foregroundColor(Color.yellow)
                .shadow(color: Color.black, radius: 5, x: 2, y: 2)
                Spacer()

                Button(action: {}) {
                    Text("Info")
                }
                .background(Image("Button"))
            }
        }
        .background(Image("Background"))
    }
    
    func pointsForCurrentRound() -> Int {
        return fullScore - abs(getSlideValueRounded() - self.target)
    }
    
    private func getSlideValueRounded() -> Int {
        return Int(sliderValue.rounded())
    }
    
    private func getScoredMessage() -> String {
        return "the slider's value is \(getSlideValueRounded())\n"
            + "the target value is \(target)\n"
            + "you scored \(pointsForCurrentRound())"
    }
    
    private func generateRandomTarget() -> Int {
        return Int.random(in: 1...100)
    }
    
    private func getTitle() -> String {
        let difference = abs(self.getSlideValueRounded() - self.target)
        
        let title: String
        
        if difference == 0 {
            title = "Perfect!"
        } else if difference < 5 {
            title = "You almost had it!"
        } else if difference <= 10 {
            title = "Not bad"
        } else {
            title = "Are you even trying?"
        }
        return title
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
