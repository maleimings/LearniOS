//
//  ContentView.swift
//  01Bullseye
//
//  Created by Valiant on 2020/4/22.
//  Copyright © 2020 Valiant. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50.0
    
    var body: some View {
        
        VStack {
            Spacer()

            HStack {
                Text("Put the bullseye as close as you can to:")
                Text("100")
                
            }
            Spacer()

            
            HStack {
                Text("1")
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100")
            }
            Spacer()

            Button(action: {
                print("Button Pressed")
                self.alertIsVisible = true
            }) {
                Text("Hit me!")
            }
            .alert(isPresented: self.$alertIsVisible) {
                Alert(title: Text("Hello there"),
                      message: Text("the slider's value is \(Int(self.sliderValue.rounded()))"),
                      dismissButton: .default(Text("Awesome!")))
            }
            Spacer()

            
            //score row
            HStack {
                Button(action: {}) {
                    Text("Start Over")
                }
                Spacer()
                
                Text("Score:")
                Text("999999")
                Spacer()

                Text("Round:")
                Text("999")
                Spacer()

                Button(action: {}) {
                    Text("Info")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
