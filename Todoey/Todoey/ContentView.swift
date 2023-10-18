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
    
    @State private var todoeyList: [Todoey] = []
    
    let userDefaults = UserDefaults.standard

    let TodoeyKey = "TodoList"

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
                    Button("Save", action: save)
                } message: {
                    Text("Add Item")
                }
            }
        }.onAppear(perform: fetch)
    }
    
    func fetch() {
        guard let list = userDefaults.object(forKey: TodoeyKey) as? [Todoey] else {
            return
        }
        todoeyList = list
    }
    
    func save() {
        print("Add \(item)")
        let id = todoeyList.count
        let todoey = Todoey(id: id, title: item)
        item = ""
        todoeyList.append(todoey)
        userDefaults.set(self.todoeyList, forKey: TodoeyKey)
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
