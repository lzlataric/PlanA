//
//  ClassContainerView.swift
//  PlanA
//
//  Created by Luka on 15.07.2023..
//

import SwiftUI

struct ClassContainerView: View {
    var subject: String
    var body: some View {
        VStack {
            Text(subject)
        }
        .frame(width: 350, height: 100)
        .background(Color.teal)
        .cornerRadius(15)
    }
}

struct ClassContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ClassContainerView(subject: "Math")
    }
}
