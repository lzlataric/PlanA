//
//  ClassPickerCell.swift
//  PlanA
//
//  Created by Luka on 06.08.2023..
//

import SwiftUI

struct ClassPickerCell: View {
    var imageName: String
    var subjectName: String
    @State var selected = false
    var body: some View {
        VStack {
            VStack {
                Image(imageName)
                    .resizable()
                    .frame(width: 25, height: 25)
            }
            .frame(width: 50, height: 50)
            .overlay(RoundedRectangle(cornerRadius: 25)
                .stroke(selected ? .blue : .black, lineWidth: selected ? 3 : 2))
            
            Text(subjectName)
        }
        .frame(width: 90, height: 100)
        .onTapGesture {
            selected.toggle()
        }
    }
}

struct ClassPickerCell_Previews: PreviewProvider {
    static var previews: some View {
        ClassPickerCell(imageName: "Math", subjectName: "Math")
    }
}
