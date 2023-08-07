//
//  ClassPickerView.swift
//  PlanA
//
//  Created by Luka on 07.08.2023..
//

import SwiftUI

struct ClassPickerView: View {
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Languages")
                        .padding(.leading, 20)
                        .font(.headline)
                    Spacer()
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(ClassModel.Languages, id: \.self) { subject in
                            ClassPickerCell(imageName: subject.imageName, subjectName: subject.name)
                        }
                    }
                    .frame(height: 100)
                    .padding(.horizontal, 20)
                }
            }
            .padding(.top, 15)
            
            VStack {
                HStack {
                    Text("Natural Science Classes")
                        .padding(.leading, 20)
                        .font(.headline)
                    Spacer()
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(ClassModel.NaturalScienceClasses, id: \.self) { subject in
                            ClassPickerCell(imageName: subject.imageName, subjectName: subject.name)
                        }
                    }
                    .frame(height: 100)
                    .padding(.horizontal, 20)
                }
            }
            .padding(.top, 15)
            
            VStack {
                HStack {
                    Text("Social Classes")
                        .padding(.leading, 20)
                        .font(.headline)
                    Spacer()
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(ClassModel.SocialClasses, id: \.self) { subject in
                            ClassPickerCell(imageName: subject.imageName, subjectName: subject.name)
                        }
                    }
                    .frame(height: 100)
                    .padding(.horizontal, 20)
                }
            }
            .padding(.top, 15)
            
            VStack {
                HStack {
                    Text("Cultural Classes")
                        .padding(.leading, 20)
                        .font(.headline)
                    Spacer()
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(ClassModel.CultureClasses, id: \.self) { subject in
                            ClassPickerCell(imageName: subject.imageName, subjectName: subject.name)
                        }
                    }
                    .frame(height: 100)
                    .padding(.horizontal, 20)
                }
            }
            .padding(.top, 15)
        }
    }
}

struct ClassPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ClassPickerView()
    }
}
