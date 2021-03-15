//
//  Place+CoreDataProperties.swift
//  Guidebook-App
//
//  Created by Kyle Sherrington on 2021-03-15.
//
//

import Foundation
import CoreData


extension Place {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Place> {
        return NSFetchRequest<Place>(entityName: "Place")
    }

    @NSManaged public var name: String?
    @NSManaged public var imageName: String?
    @NSManaged public var summary: String?
    @NSManaged public var lat: Double
    @NSManaged public var long: Double
    @NSManaged public var address: String?

}

extension Place : Identifiable {

}