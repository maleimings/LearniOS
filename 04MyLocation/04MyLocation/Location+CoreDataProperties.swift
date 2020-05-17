//
//  Location+CoreDataProperties.swift
//  04MyLocation
//
//  Created by Valiant on 2020/5/9.
//  Copyright © 2020 Valiant. All rights reserved.
//
//

import Foundation
import CoreData
import CoreLocation


extension Location {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Location> {
        return NSFetchRequest<Location>(entityName: "Location")
    }

    @NSManaged public var category: String
    @NSManaged public var date: Date
    @NSManaged public var latitude: Double
    @NSManaged public var locationDescription: String
    @NSManaged public var longitude: Double
    @NSManaged public var placemark: CLPlacemark?
    @NSManaged public var photoId:NSNumber?
}
