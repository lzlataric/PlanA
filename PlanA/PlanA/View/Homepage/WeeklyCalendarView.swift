//
//  WeeklyCalendarView.swift
//  MySchool
//
//  Created by Luka on 13.07.2023..
//

import SwiftUI

struct WeeklyCalendarView: View {
    
    @ObservedObject var viewModel: CalendarViewModel
    var week: [Date.WeekDay]
    
    var body: some View {
        //TODO: Geometry reader for size
        HStack(spacing: 0) {
            ForEach(week) { day in
                if Calendar.current.isDate(day.date, inSameDayAs: viewModel.currentUsedDate) {
                    VStack {
                        Text(viewModel.getWeeklyCalendarDayName(date: day.date))
                            .font(.system(size: 12, weight: .bold, design: .rounded))
                            .foregroundColor(.gray)
                        Text(viewModel.getWeeklyCalendarDay(date: day.date))
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(.black)
                        
                        Image(systemName: "circle.fill")
                            .font(.system(size: 10))
                            .foregroundColor(.blue)
                    }
                    .frame(width: 55, height: 60)
                    .border(.black, width: 3)
                    
                } else {
                    VStack {
                        Text(viewModel.getWeeklyCalendarDayName(date: day.date))
                            .font(.system(size: 12, weight: .bold, design: .rounded))
                            .foregroundColor(.gray)
                        Text(viewModel.getWeeklyCalendarDay(date: day.date))
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(.black)
                        
                        Image(systemName: "circle.fill")
                            .font(.system(size: 10))
                            .foregroundColor(.red)
                        
                    }
                    .frame(width: 55, height: 60)
                    .onTapGesture {
                        viewModel.currentUsedDate = day.date
                        viewModel.getTasks(date: day.date)
                    }
                }
            }
        }
        .frame(height: 100)
    }
}

//struct WeeklyCalendarView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeeklyCalendarView(viewModel: HomepageViewModel(), week: Date().getWeek())
//    }
//}
