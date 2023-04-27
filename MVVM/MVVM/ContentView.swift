//
//  ContentView.swift
//  MVVM
//
//  Created by 小林陽 on 2023/04/27.
//

import SwiftUI

// Model
struct Item: Identifiable {
    var id = UUID()
    var name: String
    var description: String
}

// ViewModel
class ItemListViewModel: ObservableObject {
    @Published var items = [
        Item(name: "Item 1", description: "This is the first item."),
        Item(name: "Item 2", description: "This is the second item."),
        Item(name: "Item 3", description: "This is the third item.")
    ]
    
    func addItem(name: String, description: String) {
        let newItem = Item(name: name, description: description)
        items.append(newItem)
    }
}

// View
struct ItemListView: View {
    @ObservedObject var viewModel = ItemListViewModel()
    @State var newItemName = ""
    @State var newItemDescription = ""
    
    var body: some View {
        VStack {
            List(viewModel.items) { item in
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                    Text(item.description)
                        .font(.subheadline)
                }
            }
            
            HStack {
                TextField("New item name", text: $newItemName)
                TextField("New item description", text: $newItemDescription)
                Button("Add item") {
                    viewModel.addItem(name: newItemName, description: newItemDescription)
                    newItemName = ""
                    newItemDescription = ""
                }
            }
            .padding()
        }
    }
}


struct ContentView: View {
    var body: some View {
        ItemListView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
