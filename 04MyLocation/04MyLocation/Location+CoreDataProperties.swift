//
//  Location+CoreDataProperties.swift
//  04MyLocation
//
//  Created by Valiant on 2020/5/8.
//  Copyright © 2020 Valiant. All rights reserved.
//
//

import Foundation
import CoreData


extension Location {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Location> {
        return NSFetchRequest<Location>(entityName: "Location")
    }

    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var date: Date
    @NSManaged public var locationDescription: String
    @NSManaged public var category: String
    @NSManaged public var plackmark: NSObject?

}
