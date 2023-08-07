//
//  WeeklyCalendarPageTabView.swift
//  PlanA
//
//  Created by Luka on 14.07.2023..
//

import SwiftUI

struct WeeklyCalendarPageTabView: View {
    @ObservedObject var viewModel: CalendarViewModel
    //@State private var selectedWeekIndex: Int = 1
    @State private var createWeek: Bool = false
    var body: some View {
        TabView(selection: $viewModel.selectedWeekIndex) {
            ForEach(viewModel.weekCollection.indices, id: \.self) { index in
                let week = viewModel.weekCollection[index]
                WeeklyCalendarView(viewModel: viewModel, week: week).tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .onChange(of: viewModel.selectedWeekIndex) { newValue in
            if newValue == 0 || newValue == viewModel.weekCollection.count-1 {
                viewModel.createNewWeek()
            }
        }
    }
    
    //DONE: Move to view model
//    func createNewWeek() {
//        if viewModel.weekCollection.indices.contains(selectedWeekIndex) {
//            if let firstDate = viewModel.weekCollection[selectedWeekIndex].first?.date, selectedWeekIndex == 0 {
//                viewModel.weekCollection.insert(firstDate.getPreviousWeek(), at: 0)
//                viewModel.weekCollection.removeLast()
//                selectedWeekIndex = 1
//            }
//
//            if let lastDate = viewModel.weekCollection[selectedWeekIndex].last?.date, selectedWeekIndex == viewModel.weekCollection.count - 1{
//                viewModel.weekCollection.append(lastDate.getNextWeek())
//                viewModel.weekCollection.removeFirst()
//                selectedWeekIndex = viewModel.weekCollection.count - 2
//            }
//        }
//    }
}

struct WeeklyCalendarPageTabView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyCalendarPageTabView(viewModel: CalendarViewModel())
    }
}
