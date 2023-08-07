//
//  AddTaskView.swift
//  PlanA
//
//  Created by Luka on 18.07.2023..
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: CalendarViewModel
    @State var subjectName = ""
    @State var taskType = ""
    @State var taskDesc = ""
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .trailing) {
                    Text("Add new task")
                        .font(.system(size: 25))
                        .frame(width: 200)
                }
                Spacer()
            }
            .padding(.top, 10)
            
            Spacer()
            
            TextField("Enter subject name", text: $subjectName)
                .frame(width: 200)
            
            TextField("Enter task type", text: $taskType)
                .frame(width: 200)
                .padding(.top, 20)
            
            TextField("Enter task description", text: $taskDesc)
                .frame(width: 200)
                .padding(.top, 20)
            
            Button("Add") {
                //TODO: empty check
                //if subjectName != "" {
                viewModel.saveTask(subjectName: subjectName, taskType: taskType, taskDesc: taskDesc)
                    dismiss()
                //}
            }
            .padding(.top, 20)
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(viewModel: CalendarViewModel())
    }
}
