//
//  StudentManager.swift
//  Scholarlly
//
//  Created by student on 8/16/24.
//

import Foundation

class Student: Codable {
    let name: String
    let email: String
    let phone: String
    let grade: String
    let birthday: String
    let gender: String
    let race: String
    let intended_major: String
    let interest: [String]
    let password: String
    
    //initilaize
    init(name: String, email: String, phone: String, grade: String, birthday: Date, gender: String, race: String, intended_major: String, interest: [String], password: String) {
        self.name = name
        self.email = email
        self.phone = phone
        self.grade = grade
        self.race = race
        self.gender = gender
        self.intended_major = intended_major
        self.interest = interest
        self.password = password
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        self.birthday = dateFormatter.string(from: birthday)
        }
}

class StudentManager {
    static let shared = StudentManager()
    
    var currentStudent: Student?
    
    private init() {}
}

