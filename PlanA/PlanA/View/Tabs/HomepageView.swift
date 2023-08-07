//
//  HomepageView.swift
//  MySchool
//
//  Created by Luka on 13.07.2023..
//

import SwiftUI

struct HomepageView: View {
    var body: some View {
        Text("Homepage")
    }
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
            .previewDisplayName("iPhone 14")
    }
}
