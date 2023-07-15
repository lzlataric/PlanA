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
    
    func getSubjects() -> [SchoolSubject] {
        var results = [SchoolSubject]()
        let subjectFetch: NSFetchRequest<SchoolSubject> = SchoolSubject.fetchRequest()
        //            let sortByDate = NSSortDescriptor(key: #keyPath(SchoolSubject.dateAdded), ascending: false)
        subjectFetch.sortDescriptors = [/*sortByDate*/]
        do {
            let managedContext = SubjectRepository.viewContext
            results = try managedContext.fetch(subjectFetch)
            print(results)
            
        } catch let error as NSError {
            print("Fetch error: \(error) description: \(error.userInfo)")
        }
        return results
    }
    
    func saveSubject(subjectName: String) throws {
        let newSubject = SchoolSubject(context: SubjectRepository.viewContext)
        newSubject.classroom = "103"
        newSubject.dayName = "Monday"
        newSubject.subjectName = subjectName
        
        try SubjectRepository.viewContext.save()
    }
    
    func deleteSubject(subject: SchoolSubject) {
        let subjets = getSubjects()
        for object in subjets {
            if object == subject {
                SubjectRepository.viewContext.delete(object)
            }
        }
        try? SubjectRepository.viewContext.save()
    }
}
