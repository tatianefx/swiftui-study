//
//  ContentView.swift
//  TatianeCard
//
//  Created by Tatiane Silva on 23/08/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.61, green: 0.35, blue: 0.71, opacity: 1.00).edgesIgnoringSafeArea(.all)
                VStack {
                    Image("tatiane")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 127.0, height: 170.0)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 3))
                    Text("Tatiane Silva")
                        .font(.custom("Pacifico-Regular", size: 40))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    Text("iOS Developer")
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                    Divider()
                    InfoView(text: "+55 123 456 789", imageName: "phone.fill")
                    InfoView(text: "tatiane@email.com", imageName: "mail.fill")
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
