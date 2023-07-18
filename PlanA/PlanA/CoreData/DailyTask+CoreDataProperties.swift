//
//  DailyTask+CoreDataProperties.swift
//  PlanA
//
//  Created by Luka on 18.07.2023..
//
//

import Foundation
import CoreData


extension DailyTask {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DailyTask> {
        return NSFetchRequest<DailyTask>(entityName: "DailyTask")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var date: Date?
    @NSManaged public var subjectName: String?
    @NSManaged public var textDescription: String?
    @NSManaged public var taskType: String?
    @NSManaged public var dateString: String?

}

extension DailyTask : Identifiable {

}
