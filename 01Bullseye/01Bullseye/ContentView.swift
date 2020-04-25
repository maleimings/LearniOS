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
            NavigationView {
            
            VStack {
                Spacer().navigationBarTitle("Bullseye")

                HStack {
                    Text("Put the bullseye as close as you can to:")
                    .modifier(LabelStyle())
                    Text("\(self.target)")
                    .modifier(ValueStyle())
                }
                Spacer()
                
                HStack {
                    Text("1")
                    .modifier(LabelStyle())
                    Slider(value: self.$sliderValue, in: 1...100)
                        .accentColor(Color.green)
                        .animation(.easeOut)
                    Text("100")
                    .modifier(LabelStyle())
                }
                Spacer()

                Button(action: {
                    self.alertIsVisible = true
                    self.round = self.round + 1
                    self.target = self.generateRandomTarget()
                }) {
                    Text("Hit me!")
                        .modifier(ButtonLargeTextStyle())
                }
                .background(Image("Button").modifier(Shadow()))
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
                        HStack {
                            Image("StartOverIcon")
                            Text("Start Over")
                            .modifier(ButtonSmallTextStyle())
                        }
                    }
                    .background(Image("Button").modifier(Shadow()))
                    Spacer()
                    
                    Text("Score:")
                    .modifier(LabelStyle())
                    Text("\(self.score)")
                    .modifier(ValueStyle())
                    Spacer()

                    Text("Round:")
                    .modifier(LabelStyle())
                    Text("\(self.round)")
                        .modifier(ValueStyle())
                    Spacer()

                    NavigationLink(destination: AboutView()) {
                        HStack {
                            Image("InfoIcon")
                            Text("Info")
                            .modifier(ButtonSmallTextStyle())
                        }
                    }
                    .background(Image("Button").modifier(Shadow()))
                }
            }
            .background(Image("Background"))
            }
            .navigationViewStyle(StackNavigationViewStyle())
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
        
        struct LabelStyle: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(Font.custom("Arial Rounded MT Bold", size: 18))
                    .foregroundColor(Color.white)
                .modifier(Shadow())
            }
        }
        
        struct Shadow: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .shadow(color: Color.black, radius: 5, x: 2, y: 2)
            }
        }
        
        struct ValueStyle: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(Font.custom("Arial Rounded MT Bold", size: 24))
                    .foregroundColor(Color.yellow)
                    .modifier(Shadow())
            }
        }
        
        struct ButtonSmallTextStyle: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(Font.custom("Arial Rounded MT Bold", size: 12))
                    .foregroundColor(Color.black)
            }
        }
        
        struct ButtonLargeTextStyle: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(Font.custom("Arial Rounded MT Bold", size: 18))
                    .foregroundColor(Color.black)
            }
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
