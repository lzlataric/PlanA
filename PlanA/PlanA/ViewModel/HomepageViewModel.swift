//
//  HomepageViewModel.swift
//  MySchool
//
//  Created by Luka on 13.07.2023..
//

import Foundation

class HomepageViewModel: ObservableObject {
    
    let dateFormatter = DateFormatter()
    
    @Published var currentUsedDate = Date()
    @Published var weekDays: [Date] = []
    
    init() {
        weekDays = Calendar.current.daysWithSameWeekOfYear(as: Date())
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
    
    func getWeekDays(date: Date) -> [Date] {
        return Calendar.current.daysWithSameWeekOfYear(as: date)
    }
    
}

extension Calendar {
  func intervalOfWeek(for date: Date) -> DateInterval? {
    dateInterval(of: .weekOfYear, for: date)
  }

  func startOfWeek(for date: Date) -> Date? {
    intervalOfWeek(for: date)?.start
  }

  func daysWithSameWeekOfYear(as date: Date) -> [Date] {
    guard let startOfWeek = startOfWeek(for: date) else {
      return []
    }

    //Since start of week is sunday it has to be 1 ...7
    return (1 ... 7).reduce(into: []) { result, daysToAdd in
      result.append(Calendar.current.date(byAdding: .day, value: daysToAdd, to: startOfWeek))
    }
    .compactMap { $0 }
  }
}
