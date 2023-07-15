//
//  SwiftUIView.swift
//  PlanA
//
//  Created by Luka on 15.07.2023..
//

import SwiftUI

struct DailyClassScheduleView: View {
    @ObservedObject var viewModel: ClassScheduleViewModel
    @State var shouldAdd = false
    var body: some View {
        VStack {
            Text("Monday")
                .font(.headline)
                .fontWeight(.bold)
            
           Spacer()
            
            ScrollView {
                ForEach(viewModel.subjects, id: \.self) { subject in
                    ClassContainerView(subject: subject.subjectName ?? "NaN")
                        .onLongPressGesture {
                            viewModel.deleteSubject(subject: subject)
                        }
                }
                ClassContainerAddView()
                    .onTapGesture {
                        shouldAdd = true
                    }
            }
            .padding(.top, 50)
            Spacer()
        }
        .sheet(isPresented: $shouldAdd) {
                    AddClassView(viewModel: viewModel)
                }
    }
}

struct DailyClassScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        DailyClassScheduleView(viewModel: ClassScheduleViewModel())
    }
}
