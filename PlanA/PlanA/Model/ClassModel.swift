//
//  ClassModel.swift
//  PlanA
//
//  Created by Luka on 06.08.2023..
//

import Foundation

struct ClassModel: Hashable {
    var name: String
    var imageName: String
    
    static let Languages = [ClassModel(name: "Croatian", imageName: "Croatia"),
                            ClassModel(name: "English", imageName: "English"),
                            ClassModel(name: "German", imageName: "Germany"),
                            ClassModel(name: "Italian", imageName: "Italy"),
                            ClassModel(name: "Spanish", imageName: "Spain"),
                            ClassModel(name: "French", imageName: "France"),
                            ClassModel(name: "Latin", imageName: "Latin"),
                            ClassModel(name: "Old Greek", imageName: "OldGreek")]
    
    static let NaturalScienceClasses = [ClassModel(name: "Math", imageName: "Math"),
                                        ClassModel(name: "Nature", imageName: "Nature"),
                                        ClassModel(name: "Biology", imageName: "Biology"),
                                        ClassModel(name: "Chemistry", imageName: "Chemistry"),
                                        ClassModel(name: "Physics", imageName: "Physics"),
                                        ClassModel(name: "Informatics", imageName: "Informatics")]
    
    static let SocialClasses = [ClassModel(name: "Geography", imageName: "Geography"),
                                ClassModel(name: "History", imageName: "History"),
                                ClassModel(name: "Psychology", imageName: "Psychology"),
                                ClassModel(name: "Philosophy", imageName: "Philosophy"),
                                ClassModel(name: "Sociology", imageName: "Sociology"),
                                ClassModel(name: "Logic", imageName: "Logic"),
                                ClassModel(name: "Politics", imageName: "Politics")]
    
    static let CultureClasses = [ClassModel(name: "Art", imageName: "Art"),
                                 ClassModel(name: "Music", imageName: "Music"),
                                 ClassModel(name: "Gimnastics", imageName: "Gimnastics"),
                                 ClassModel(name: "Ethics", imageName: "Ethics"),
                                 ClassModel(name: "Religion", imageName: "Religion")]
}


