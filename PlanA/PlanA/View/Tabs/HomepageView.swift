//
//  HomepageView.swift
//  MySchool
//
//  Created by Luka on 13.07.2023..
//

import SwiftUI

struct HomepageView: View {
    
    @ObservedObject var viewModel: CalendarViewModel
    @State var createTask = false
    var body: some View {
        ZStack {
            Color.lightGray
                .ignoresSafeArea()
            VStack {
                HStack {
                    VStack(alignment: .leading){
                        Text(viewModel.getDayName(date: viewModel.currentUsedDate))
                            .font(.title)
                            .fontWeight(.bold)
                        Text(viewModel.getHomepageTitleDateFormat(date: viewModel.currentUsedDate))
                    }
                    .padding(.leading, 20)
                    Spacer()
                }
                WeeklyCalendarPageTabView(viewModel: viewModel)
                    .frame(height: 65)
                    .padding(.top, 20)
                
                Button("Add task") {
                    createTask = true
                }
                
                        ScrollView {
                            ForEach(viewModel.dailyTasks, id: \.self) { task in
                                ClassContainerView(subject: task.subjectName ?? "NaN")
                                    .onLongPressGesture {
                                        viewModel.deleteTask(task: task)
                                    }
                            }
                //            ClassContainerAddView()
                //                .onTapGesture {
                //                    shouldAdd = true
                //                }
                        }
                
                .sheet(isPresented: $createTask) {
                    AddTaskView(viewModel: viewModel)
                }
                
                Spacer()
            }
        }
    }
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView(viewModel: CalendarViewModel())
            .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
            .previewDisplayName("iPhone 14")
    }
}
