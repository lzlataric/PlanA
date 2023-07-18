//
//  SchoolSubject+CoreDataProperties.swift
//  PlanA
//
//  Created by Luka on 18.07.2023..
//
//

import Foundation
import CoreData


extension SchoolSubject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SchoolSubject> {
        return NSFetchRequest<SchoolSubject>(entityName: "SchoolSubject")
    }

    @NSManaged public var classroom: String?
    @NSManaged public var dayName: String?
    @NSManaged public var subjectName: String?
    @NSManaged public var id: UUID?

}

extension SchoolSubject : Identifiable {

}
