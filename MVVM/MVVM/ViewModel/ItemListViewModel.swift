//
//  ItemListViewModel.swift
//  MVVM
//
//  Created by 小林陽 on 2023/04/27.
//

import Foundation

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
