//
//  PropertyManagedObject+CoreDataProperties.swift
//  Estate Rental
//
//  Created by 潘丰 on 14/11/2020.
//
//

import Foundation
import CoreData


extension PropertyManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PropertyManagedObject> {
        return NSFetchRequest<PropertyManagedObject>(entityName: "Property")
    }

    @NSManaged public var bedrooms: Int32
    @NSManaged public var createdAt: Int32
    @NSManaged public var estate: String?
    @NSManaged public var expected_tenants: Int32
    @NSManaged public var gross_area: Int32
    @NSManaged public var h_Property: String?
    @NSManaged public var id: Int32
    @NSManaged public var image_URL: String?
    @NSManaged public var property_title: String?
    @NSManaged public var rent: Int32
    @NSManaged public var updatedAt: Int32

}

extension PropertyManagedObject : Identifiable {

}
