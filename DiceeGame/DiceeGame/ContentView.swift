//
//  ContentView.swift
//  DiceeGame
//
//  Created by Tatiane Silva on 30/08/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftDiceNumber: DiceNumber = .one
    @State var rightDiceNumber: DiceNumber = .one
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("diceeLogo")
                
                Spacer()
                
                HStack {
                    DiceView(value: leftDiceNumber)
                    DiceView(value: rightDiceNumber)
                }.padding(.horizontal)
                
                Spacer()

                Button {
                    leftDiceNumber = DiceNumber.randon()
                    rightDiceNumber = DiceNumber.randon()
                } label: {
                    Text("Roll")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        
                }
                .background(Color.red)
                .cornerRadius(12)

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
