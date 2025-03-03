//
//  ProgramsManager.swift
//  Scholarlly
//
//  Created by student on 9/11/24.
//

import Foundation

struct Programs: Decodable, Hashable {
    let title: String
    let description: String
    let opp_type: String
    let institution: String
    let eligibility: [String]
    let match_score: Int?
    let deadline: Date
    let tags: [String]
    
    init(title: String, description: String, opp_type: String, institution: String, eligibility: [String], match_score: Int, deadline: Date, tags:[String]) {
        self.title = title
        self.description = description
        self.opp_type = opp_type
        self.institution = institution
        self.eligibility = eligibility
        self.match_score = match_score
        self.deadline = deadline
        self.tags = tags
    }
}

class ProgramsManager {
    static let shared = ProgramsManager()
    
    var programslist: Programs?
    
    private init() {}
}
