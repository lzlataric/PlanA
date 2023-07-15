//
//  ClassScheduleView.swift
//  MySchool
//
//  Created by Luka on 13.07.2023..
//

import SwiftUI

struct ClassScheduleView: View {
    @ObservedObject var viewModel = ClassScheduleViewModel()
    var body: some View {
        TabView() {
            DailyClassScheduleView(viewModel: viewModel)
            DailyClassScheduleView(viewModel: viewModel)
            DailyClassScheduleView(viewModel: viewModel)
            DailyClassScheduleView(viewModel: viewModel)
            DailyClassScheduleView(viewModel: viewModel)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

struct ClassScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ClassScheduleView()
    }
}
