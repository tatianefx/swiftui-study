//
//  ContentView.swift
//  Todoey
//
//  Created by Tatiane Silva on 22/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var item = ""
    
    @State private var showingAlert = false
    
    @State private var todoeyList = [
        Item(id: 0, title: "Find Mike"),
        Item(id: 1, title: "Buy Eggos"),
        Item(id: 2, title: "Destroy Demogorgon")

    ]
        
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Todoey.plist")

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
            .toolbar {
                Button {
                    showingAlert = true
                } label: {
                    Image(systemName: "plus")
                }
                .alert("Add New Todoey Item", isPresented: $showingAlert) {
                    TextField("", text: $item)
                    Button("Save", action: saveItems)
                } message: {
                    Text("Add Item")
                }
            }
        }.onAppear(perform: fetch)
    }
    
    func fetch() {
        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true))
    }
    
    func saveItems() {
        print("Add \(item)")
        let id = todoeyList.count
        let todoey = Item(id: id, title: item)
        item = ""
        todoeyList.append(todoey)
        
        guard let dataFilePath = dataFilePath else { return }
        
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(todoeyList)
            try data.write(to: dataFilePath)
        } catch {
            print("Error encoding todoey array")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
