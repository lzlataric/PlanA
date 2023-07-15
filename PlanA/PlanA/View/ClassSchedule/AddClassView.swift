//
//  AddClassView.swift
//  PlanA
//
//  Created by Luka on 15.07.2023..
//

import SwiftUI

struct AddClassView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: ClassScheduleViewModel
    @State var subjectName = ""
    var body: some View {
        VStack {
            TextField("Enter subject name", text: $subjectName)
                .frame(width: 200)
            
            Button("Add") {
                if subjectName != "" {
                    viewModel.saveSubject(subjectName: subjectName, dayName: viewModel.selectedDay)
                    dismiss()
                }
            }
        }
    }
}

struct AddClassView_Previews: PreviewProvider {
    static var previews: some View {
        AddClassView(viewModel: ClassScheduleViewModel())
    }
}
