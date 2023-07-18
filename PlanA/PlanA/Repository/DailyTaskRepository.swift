//
//  DailyTaskRepository.swift
//  PlanA
//
//  Created by Luka on 18.07.2023..
//

import Foundation
import CoreData

class DailyTaskRepository {
    private let viewContext = CoreDataProvider.shared.persistentContainer.viewContext
    
    func getDailyTask(date: Date) -> [DailyTask] {
        var results = [DailyTask]()
        let taskFetch: NSFetchRequest<DailyTask> = DailyTask.fetchRequest()
        let predicate = NSPredicate(format: "dateString = %@", date.getStringDate())
        taskFetch.sortDescriptors = []
        taskFetch.predicate = predicate
        do {
            let managedContext = viewContext
            results = try managedContext.fetch(taskFetch)
        } catch let error as NSError {
            print("Fetch error: \(error) description: \(error.userInfo)")
        }
        return results
    }
    
    func saveTask(date: Date, subjectName: String, taskType: String, taskDesc: String) throws {
        let newTask = DailyTask(context: viewContext)
        newTask.id = UUID()
        newTask.date = date
        newTask.dateString = date.getStringDate()
        newTask.subjectName = subjectName
        newTask.taskType = taskType
        newTask.textDescription = taskDesc
        try viewContext.save()
    }
    
    func deleteSubject(task: DailyTask, date: Date) {
        let tasks = getDailyTask(date: date)
        for object in tasks {
            if object == task {
                viewContext.delete(object)
            }
        }
        try? viewContext.save()
    }
}
