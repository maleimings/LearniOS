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
    var body: some View {
        VStack {
            Text("Welcome to my first App")
                .fontWeight(.semibold)
                .foregroundColor(.yellow)
            Button(action: {
                print("Button Pressed")
                self.alertIsVisible = true
            }) {
                Text("Hit me")
            }
            .alert(isPresented: self.$alertIsVisible) {
                Alert(title: Text("Hello there"), message: Text("This is my first App"), dismissButton: .default(Text("Awesome!")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
