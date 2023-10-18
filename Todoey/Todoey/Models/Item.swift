//
//  Item.swift
//  Todoey
//
//  Created by Tatiane Silva on 18/10/23.
//

import Foundation

struct Item: Identifiable {
    let id: Int
    let title: String
    var isSelected: Bool = false
}
