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
    
    public var hasPhoto: Bool {
        return photoId != nil
    }
    
    public var photoURL: URL {
        assert(photoId != nil, "No photo ID set")
        
        let filename = "Photo-\(photoId!.intValue).jpg"
        
        return applicationDocumentsDirectory.appendingPathComponent(filename)
    }
    
    public var photoImage: UIImage? {
        return UIImage(contentsOfFile: photoURL.path)
    }
    
    func removePhotoFile() {
        if hasPhoto {
            do {
                try FileManager.default.removeItem(at: photoURL)
            } catch {
                print("Error removing file: \(error)")
            }
        }
    }
    
    class func nextPhotoID() -> Int {
        let userDefaults = UserDefaults.standard
        let currentID = userDefaults.integer(forKey: "PhotoID") + 1
        userDefaults.set(currentID, forKey: "PhotoID")
        userDefaults.synchronize()
        
        return currentID
    }
}
