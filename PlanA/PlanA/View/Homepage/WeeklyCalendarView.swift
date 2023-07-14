//
//  WeeklyCalendarView.swift
//  MySchool
//
//  Created by Luka on 13.07.2023..
//

import SwiftUI

struct WeeklyCalendarView: View {
    
    @ObservedObject var viewModel: HomepageViewModel
    
    var body: some View {
        
        HStack(spacing: 5) {
            Button {
                print("Back")
            } label: {
                Image(systemName: "arrow.left.square.fill")
                    .font(.system(size: 30))
                    .tint(.black)
            }
            Image(systemName: "")
            ForEach(viewModel.weekDays, id: \.self) { day in
                if Calendar.current.isDate(day, inSameDayAs: viewModel.currentUsedDate) {
                    VStack {
                        Text(viewModel.getWeeklyCalendarDayName(date: day))
                            .font(.system(size: 12, weight: .bold, design: .rounded))
                            .foregroundColor(.gray)
                        Text(viewModel.getWeeklyCalendarDay(date: day))
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(.black)
                        //                    Text(viewModel.getWeeklyCalendarDayMonth(date: day))
                        //                        .font(.system(size: 15, weight: .regular, design: .rounded))
                        //                        .foregroundColor(.black)
                        
                        Image(systemName: "circle.fill")
                            .font(.system(size: 10))
                            .foregroundColor(.blue)
                    }
                    .frame(width: 40, height: 60)
//                    .background(
//                        RoundedRectangle(cornerRadius: 16)
//                            .stroke(.white, lineWidth: 2)
//                            .background(
//                                RoundedRectangle(cornerRadius: 16)
//                                    .fill(.black)
//                            )
//                    )
                    .border(.black, width: 3)
                    
                } else {
                    VStack {
                        Text(viewModel.getWeeklyCalendarDayName(date: day))
                            .font(.system(size: 12, weight: .bold, design: .rounded))
                            .foregroundColor(.gray)
                        Text(viewModel.getWeeklyCalendarDay(date: day))
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(.black)
                        //                    Text(viewModel.getWeeklyCalendarDayMonth(date: day))
                        //                        .font(.system(size: 15, weight: .regular, design: .rounded))
                        //                        .foregroundColor(.black)
                        
                        Image(systemName: "circle.fill")
                            .font(.system(size: 10))
                            .foregroundColor(.red)
                        
                    }
                    .frame(width: 40, height: 60)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 16)
//                            .stroke(.black, lineWidth: 2)
//                    )
                    //.border(.gray, width: 2)
                    .onTapGesture {
                        viewModel.currentUsedDate = day
                    }
                }
            }
            Button {
                print("Forward")
            } label: {
                Image(systemName: "arrow.right.square.fill")
                    .font(.system(size: 30))
                    .tint(.black)
            }
        }
        .frame(height: 100)
        //.background(Color.lightGray)
    }
}

struct WeeklyCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyCalendarView(viewModel: HomepageViewModel())
    }
}

extension Color {
    static let lightGray = Color("Lightgray")
}
