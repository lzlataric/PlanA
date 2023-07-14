//
//  HomepageView.swift
//  MySchool
//
//  Created by Luka on 13.07.2023..
//

import SwiftUI

struct HomepageView: View {
    
    @ObservedObject var viewModel: HomepageViewModel
    @State var selectedDate = Date()
    
    
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
                
                WeeklyCalendarView(viewModel: viewModel)
                    .padding(.top, 20)
                
                Spacer()
                
                Button("Button title") {
                    var dayComponent    = DateComponents()
                    dayComponent.day    = 1
                    viewModel.currentUsedDate = Calendar.current.date(byAdding: dayComponent, to: viewModel.currentUsedDate) ?? Date()
                    print("AA")
                }
            }
        }
    }
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView(viewModel: HomepageViewModel())
            .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
            .previewDisplayName("iPhone 14")
    }
}
