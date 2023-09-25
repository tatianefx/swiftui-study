//
//  ContentView.swift
//  Todoey
//
//  Created by Tatiane Silva on 22/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var todoeyList = [
        Todoey(id: 1, title: "Find Mike"),
        Todoey(id: 2, title: "Buy Eggos"),
        Todoey(id: 3, title: "Destroy Demogorgon")
    ]
    
    var body: some View {
        NavigationView {
            List($todoeyList) { $item in
                Button {
                    item.isSelected.toggle()
                    print("Select \(item.title)")
                } label: {
                    HStack {
                        Text(item.title)
                        Spacer()
                        Image(systemName: "checkmark")
                            .foregroundColor(.blue)
                            .opacity(item.isSelected ? 1.0 : 0.0)
                    }
                }
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
    var isSelected: Bool = false
}
