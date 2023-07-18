//
//  ContentView.swift
//  MySchool
//
//  Created by Luka on 13.07.2023..
//

import SwiftUI

struct TabbarView: View {
    var body: some View {
        @ObservedObject var classScheduleViewModel = ClassScheduleViewModel()
        @ObservedObject var calendarViewModel = CalendarViewModel()
        TabView {
            ClassScheduleView(viewModel: classScheduleViewModel)
                .tabItem {
                    Label("Schedule", systemImage: "studentdesk")
                }
            
            HomepageView(viewModel: calendarViewModel)
                .tabItem {
                    Label("Home", systemImage: "list.bullet.clipboard")
                }
            
            MainCalendarView()
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                }
        }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
