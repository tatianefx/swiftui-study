//
//  ContentView.swift
//  Todoey
//
//  Created by Tatiane Silva on 22/09/23.
//

import SwiftUI

struct ContentView: View {
    
    var todoeyList = [
        Todoey(id: 1, title: "Find Mike"),
        Todoey(id: 2, title: "Buy Eggos"),
        Todoey(id: 3, title: "Destroy Demogorgon")
    ]
    
    var body: some View {
        NavigationView {
            List(todoeyList) { item in
                Text(item.title)

            }
            .navigationTitle("Todoey List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Todoey: Identifiable {
    let id: Int
    let title: String
}
