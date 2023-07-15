//
//  ClassScheduleViewModel.swift
//  PlanA
//
//  Created by Luka on 15.07.2023..
//

import Foundation
import SwiftUI

enum Days: String {
    case monday = "Monday"
    case tuesday = "Tuesday"
    case wednesday = "Wednesday"
    case thursday = "Thursday"
    case friday = "Friday"
    case saturday = "Saturday"
    case sunday = "Sunday"
}

class ClassScheduleViewModel: ObservableObject {
    private var subjectRepository = SubjectRepository()
    var days: [Days] = [.monday, .tuesday, .wednesday, .thursday, .friday, .saturday, .sunday]
    
    @Published var selectedDay: Days = .monday
    @Published var mondaySubjects = [SchoolSubject]()
    @Published var tuesdaySubjects = [SchoolSubject]()
    @Published var wednesdaySubjects = [SchoolSubject]()
    @Published var thursdaySubjects = [SchoolSubject]()
    @Published var fridaySubjects = [SchoolSubject]()
    @Published var saturdaySubjects = [SchoolSubject]()
    @Published var sundaySubjects = [SchoolSubject]()
    
    init() {
        for day in days {
            getSubjets(dayName: day)
        }
    }
    
    func saveSubject(subjectName: String, dayName: Days) {
        do {
            try subjectRepository.saveSubject(subjectName: subjectName, dayName: dayName)
        } catch {
            print("EROOOOOOOOR")
        }
        getSubjets(dayName: dayName)
    }
    
    func getSubjets(dayName: Days) {
        switch dayName {
        case .monday:
            mondaySubjects = subjectRepository.getSubjects(dayName: dayName)
        case .tuesday:
            tuesdaySubjects = subjectRepository.getSubjects(dayName: dayName)
        case .wednesday:
            wednesdaySubjects = subjectRepository.getSubjects(dayName: dayName)
        case .thursday:
            thursdaySubjects = subjectRepository.getSubjects(dayName: dayName)
        case .friday:
            fridaySubjects = subjectRepository.getSubjects(dayName: dayName)
        case .saturday:
            saturdaySubjects = subjectRepository.getSubjects(dayName: dayName)
        case .sunday:
            sundaySubjects = subjectRepository.getSubjects(dayName: dayName)
        }
    }
    
    func deleteSubject(subject: SchoolSubject, dayName: Days) {
        subjectRepository.deleteSubject(subject: subject, dayName: dayName)
        getSubjets(dayName: dayName)
    }
 }
