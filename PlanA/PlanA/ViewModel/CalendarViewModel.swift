//
//  HomepageViewModel.swift
//  MySchool
//
//  Created by Luka on 13.07.2023..
//

import Foundation
import Combine

class CalendarViewModel: ObservableObject {
    
    private var dailyTaskRepository = DailyTaskRepository()
    
    @Published var currentUsedDate = Date()
    @Published var weekCollection: [[Date.WeekDay]] = []
    @Published var dailyTasks: [DailyTask] = []
    @Published var selectedWeekIndex = 1
    
    init() {
        let currentWeek = Date().getWeek()
        getTasks(date: Date())
        
        if let firstDate = currentWeek.first?.date {
            weekCollection.append(firstDate.getPreviousWeek())
        }
        
        weekCollection.append(currentWeek)
        
        if let lastDate = currentWeek.last?.date {
            weekCollection.append(lastDate.getNextWeek())
        }
    }
    
    func getTasks(date: Date) {
        dailyTasks = dailyTaskRepository.getDailyTask(date: date)
    }
    
    func saveTask(subjectName: String, taskType: String, taskDesc: String) {
        do {
            try dailyTaskRepository.saveTask(date: currentUsedDate, subjectName: subjectName, taskType: taskType, taskDesc: taskDesc)
        } catch {
            print(error.localizedDescription)
        }
        getTasks(date: currentUsedDate)
    }
    
    func deleteTask(task: DailyTask) {
        dailyTaskRepository.deleteSubject(task: task, date: currentUsedDate)
        getTasks(date: currentUsedDate)
    }
    
    func createNewWeek() {
        if weekCollection.indices.contains(selectedWeekIndex) {
            if let firstDate = weekCollection[selectedWeekIndex].first?.date, selectedWeekIndex == 0 {
                weekCollection.insert(firstDate.getPreviousWeek(), at: 0)
                weekCollection.removeLast()
                selectedWeekIndex = 1
            }
            
            if let lastDate = weekCollection[selectedWeekIndex].last?.date, selectedWeekIndex == weekCollection.count - 1{
                weekCollection.append(lastDate.getNextWeek())
                weekCollection.removeFirst()
                selectedWeekIndex = weekCollection.count - 2
            }
        }
    }

    
    //DONE: Move this to date extension
//    func getDayName(date: Date) -> String {
//        dateFormatter.dateFormat = "EEEE"
//        return dateFormatter.string(from: date)
//    }
//
//    func getHomepageTitleDateFormat(date: Date) -> String {
//        dateFormatter.dateFormat = "MMM d, yyyy"
//        return dateFormatter.string(from: date)
//    }
//
//    func getWeeklyCalendarDayName(date: Date) -> String {
//        dateFormatter.dateFormat = "EEE"
//        return dateFormatter.string(from: date)
//    }
//
//    func getWeeklyCalendarDay(date: Date) -> String {
//        dateFormatter.dateFormat = "d"
//        return dateFormatter.string(from: date)
//    }
//
//    func getWeeklyCalendarDayMonth(date: Date) -> String {
//        dateFormatter.dateFormat = "MMM"
//        return dateFormatter.string(from: date)
//    }
}
