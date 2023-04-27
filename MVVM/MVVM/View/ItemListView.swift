//
//  ItemListView.swift
//  MVVM
//
//  Created by 小林陽 on 2023/04/27.
//

import SwiftUI

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

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView()
    }
}
