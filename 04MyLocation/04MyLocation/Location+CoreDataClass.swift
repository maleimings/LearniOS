//
//  Location+CoreDataClass.swift
//  04MyLocation
//
//  Created by Valiant on 2020/5/8.
//  Copyright © 2020 Valiant. All rights reserved.
//
//

import Foundation
import CoreData
import MapKit

@objc(Location)
public class Location: NSManagedObject, MKAnnotation {
  public var coordinate: CLLocationCoordinate2D {
    return CLLocationCoordinate2DMake(latitude, longitude)
  }
  
  public var title: String? {
    if locationDescription.isEmpty {
      return "(No Description)"
    } else {
      return locationDescription
    }
  }
  
  public var subtitle: String? {
    return category
  }
}
