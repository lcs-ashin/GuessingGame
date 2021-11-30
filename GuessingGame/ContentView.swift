//
//  ContentView.swift
//  GuessingGame
//
//  Created by Eunbi Shin on 2021-11-30.
//

import SwiftUI

struct ContentView: View {
    // MARK: Stored Property
    @State var number = 10.0
    
    // The feedback given to the user
    @State var feedback = ""
    
    // The target the use is trying to guess
    // A random value between 1 and 100, inclusive
    let target = Int.random(in: 1...100)
    
    // MARK: Computed Property
    var body: some View {
        
        VStack {
            
            // Output - show current guess
            Text(String(format: "%.0f", number))
                .font(.title2.bold())
            
            // Input - select current guess
            Slider(value: $number,
                   in: 0...100,
                   step: 1.0,
                   label: {
                Text("Number")
            },
                   minimumValueLabel: {
                Text("0")
            },
                   maximumValueLabel: {
                Text("100")
            })
            
            // Input - check the guess
            Button(action: {
                
                // Create a temporary constant with the guess as an integer
                let numberAsInteger = Int(number)
                
                // Check the user's guess
                if numberAsInteger > target {
                    feedback = "Guess lower next time."
                } else if numberAsInteger < target {
                    feedback = "Guess higher next time."
                } else {
                    feedback = "You guessed it!"
                }
                
            }, label: {
                Text("Submit Guess")
            })
                .buttonStyle(.bordered)
            
            // Output - show feedback
            Text("\(feedback)")
                .italic()
                .padding()
            
            // DEBUG - show the secret target
            Text("The actual secret number is: \(target)")
            
            Spacer()
            
        }
        .padding()
        .navigationTitle("Guessing Game")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
