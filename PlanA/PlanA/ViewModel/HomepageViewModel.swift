//
//  HomepageViewModel.swift
//  MySchool
//
//  Created by Luka on 13.07.2023..
//

import Foundation
import Combine

class HomepageViewModel: ObservableObject {
    
    let dateFormatter = DateFormatter()
    
    @Published var currentUsedDate = Date()
    @Published var weekCollection: [[Date.WeekDay]] = []
    
    init() {
        let currentWeek = Date().getWeek()
        
        if let firstDate = currentWeek.first?.date {
            weekCollection.append(firstDate.getPreviousWeek())
        }
        
        weekCollection.append(currentWeek)
        
        if let lastDate = currentWeek.last?.date {
            weekCollection.append(lastDate.getNextWeek())
        }
    }
    
    func getDayName(date: Date) -> String {
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: date)
    }

    func getHomepageTitleDateFormat(date: Date) -> String {
        dateFormatter.dateFormat = "MMM d, yyyy"
        return dateFormatter.string(from: date)
    }
    
    func getWeeklyCalendarDayName(date: Date) -> String {
        dateFormatter.dateFormat = "EEE"
        return dateFormatter.string(from: date)
    }
    
    func getWeeklyCalendarDay(date: Date) -> String {
        dateFormatter.dateFormat = "d"
        return dateFormatter.string(from: date)
    }
    
    func getWeeklyCalendarDayMonth(date: Date) -> String {
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.string(from: date)
    }
}
