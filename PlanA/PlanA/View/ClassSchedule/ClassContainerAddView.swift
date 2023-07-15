//
//  ClassContainerAddView.swift
//  PlanA
//
//  Created by Luka on 15.07.2023..
//

import SwiftUI

struct ClassContainerAddView: View {
    var body: some View {
        VStack {
            Image(systemName: "plus.circle.fill")
                .font(.system(size: 40))
                .foregroundColor(.white)
        }
        .frame(width: 350, height: 60)
        .background(Color.teal)
        .cornerRadius(15)
    }
}

struct ClassContainerAddView_Previews: PreviewProvider {
    static var previews: some View {
        ClassContainerAddView()
    }
}
