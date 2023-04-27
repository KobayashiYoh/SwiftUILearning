//
//  Item.swift
//  MVVM
//
//  Created by 小林陽 on 2023/04/27.
//

import Foundation

struct Item: Identifiable {
    var id = UUID()
    var name: String
    var description: String
}
