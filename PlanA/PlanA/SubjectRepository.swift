//
//  SubjectService.swift
//  PlanA
//
//  Created by Luka on 15.07.2023..
//

import Foundation
import CoreData

class SubjectRepository {
    
    static var viewContext: NSManagedObjectContext {
        CoreDataProvider.shared.persistentContainer.viewContext
    }
    
    func getSubjects(dayName: Days) -> [SchoolSubject] {
        var results = [SchoolSubject]()
        let subjectFetch: NSFetchRequest<SchoolSubject> = SchoolSubject.fetchRequest()
        subjectFetch.sortDescriptors = []
        do {
            let managedContext = SubjectRepository.viewContext
            results = try managedContext.fetch(subjectFetch)
            results = results.filter( { $0.dayName == dayName.rawValue } )
        } catch let error as NSError {
            print("Fetch error: \(error) description: \(error.userInfo)")
        }
        return results
    }
    
    func saveSubject(subjectName: String, dayName: Days) throws {
        let newSubject = SchoolSubject(context: SubjectRepository.viewContext)
        newSubject.classroom = String(Int.random(in: 1..<100))
        newSubject.dayName = dayName.rawValue
        newSubject.subjectName = subjectName
        try SubjectRepository.viewContext.save()
    }
    
    func deleteSubject(subject: SchoolSubject, dayName: Days) {
        let subjets = getSubjects(dayName: dayName)
        for object in subjets {
            if object == subject {
                SubjectRepository.viewContext.delete(object)
            }
        }
        try? SubjectRepository.viewContext.save()
    }
}
