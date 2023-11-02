//
//  ContentView.swift
//  Todoey
//
//  Created by Tatiane Silva on 22/09/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State private var item = ""
    
    @State private var showingAlert = false
            
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        entity: Item.entity(),
        sortDescriptors: []
    ) var todoeyList: FetchedResults<Item>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(todoeyList, id: \.self) { item in
                    Button {
                        updateItem(item)
                    } label: {
                        HStack {
                            Text(item.title ?? "")
                            Spacer()
                            Image(systemName: "checkmark")
                                .foregroundColor(.blue)
                                .opacity(item.isSelected ? 1.0 : 0.0)
                        }
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
//        DispatchQueue.main.async {
//            self.todoeyList = todoeyList.reversed()
//        }
    }
    
    func saveItem() {
        print("Add \(item)")
        
        let todoey = Item(context: viewContext)
        todoey.id = Int64(todoeyList.count)
        todoey.title = item
        
        item = ""
        
        persistItems()
    }
    
    func updateItem(_ item: Item) {
        item.isSelected.toggle()
        persistItems()
        print("Select \(item.title ?? "")")
    }
    
    func persistItems() {
        do {
            try viewContext.save() // Salvar o contexto do Core Data
        } catch {
            let nsError = error as NSError
            fatalError("Erro ao salvar no Core Data: \(nsError)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
