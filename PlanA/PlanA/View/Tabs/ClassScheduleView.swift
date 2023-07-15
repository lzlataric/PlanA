//
//  ClassScheduleView.swift
//  MySchool
//
//  Created by Luka on 13.07.2023..
//

import SwiftUI

struct ClassScheduleView: View {
    @ObservedObject var viewModel = ClassScheduleViewModel()
    @State private var selectedWeekIndex: Int = 0
    var body: some View {
        TabView(selection: self.$selectedWeekIndex) {
//            ForEach(viewModel.days.indices, id: \.self) { index in
//                DailyClassScheduleView(viewModel: viewModel).tag(index)
//            }
            //TODO: Refactor if possible
            DailyClassScheduleView(viewModel: viewModel, subjectList: $viewModel.mondaySubjects).tag(0)
            DailyClassScheduleView(viewModel: viewModel, subjectList: $viewModel.tuesdaySubjects).tag(1)
            DailyClassScheduleView(viewModel: viewModel, subjectList: $viewModel.wednesdaySubjects).tag(2)
            DailyClassScheduleView(viewModel: viewModel, subjectList: $viewModel.thursdaySubjects).tag(3)
            DailyClassScheduleView(viewModel: viewModel, subjectList: $viewModel.fridaySubjects).tag(4)
            DailyClassScheduleView(viewModel: viewModel, subjectList: $viewModel.saturdaySubjects).tag(5)
            DailyClassScheduleView(viewModel: viewModel, subjectList: $viewModel.sundaySubjects).tag(6)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .onChange(of: selectedWeekIndex) { newValue in
            viewModel.selectedDay = viewModel.days[newValue]
            viewModel.getSubjets(dayName: viewModel.selectedDay)
        }
    }
}

struct ClassScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ClassScheduleView()
    }
}
