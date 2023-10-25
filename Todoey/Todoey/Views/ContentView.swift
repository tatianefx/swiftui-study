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
    
    @State private var todoeyList = [Item]()
        
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Todoey.plist")

    var body: some View {
        NavigationView {
            List($todoeyList) { $item in
                Button {
                    item.isSelected.toggle()
                    persistItems()
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
                    Button("Save", action: saveItem)
                } message: {
                    Text("Add Item")
                }
            }
        }.onAppear(perform: loadItems)
    }
    
    func loadItems() {
        guard let dataFilePath = dataFilePath,
              let data = try? Data(contentsOf: dataFilePath)
        else { return }
        
        let decoder = PropertyListDecoder()
        var items = [Item]()
        do {
            items = try decoder.decode([Item].self, from: data)
        } catch {
            print("Error dencoding todoey array")
        }
        
        DispatchQueue.main.async {
            self.todoeyList = items
        }
    }
    
    func saveItem() {
        print("Add \(item)")
        
        let id = todoeyList.count
        let todoey = Item(id: id, title: item)
        
        item = ""
        todoeyList.append(todoey)
        
        persistItems()
    }
    
    func persistItems() {
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
