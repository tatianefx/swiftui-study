//
//  Item+CoreDataProperties.swift
//  Todoey
//
//  Created by Tatiane Silva on 26/10/23.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var id: Int64
    @NSManaged public var title: String?
    @NSManaged public var isSelected: Bool

}

extension Item : Identifiable {

}
