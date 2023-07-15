//
//  ClassScheduleViewModel.swift
//  PlanA
//
//  Created by Luka on 15.07.2023..
//

import Foundation

enum Days {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

class ClassScheduleViewModel: ObservableObject {
    private var subjectRepository = SubjectRepository()
    //private var days: [Days] = [.monday, .tuesday, .wednesday, .thursday, .friday, .saturday, .sunday]
    @Published var subjects = [SchoolSubject]()
    
    //@Published var selectedDay: Days = .monday
    
    init() {
        getSubjets()
    }
    
    func saveSubject(subjectName: String) {
        do {
            try subjectRepository.saveSubject(subjectName: subjectName)
        } catch {
            print("EROOOOOOOOR")
        }
        getSubjets()
    }
    
    func getSubjets() {
        subjects = subjectRepository.getSubjects()
    }
    
    func deleteSubject(subject: SchoolSubject) {
        subjectRepository.deleteSubject(subject: subject)
        getSubjets()
    }
}
