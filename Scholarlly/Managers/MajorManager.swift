//
//  MajorManager.swift
//  Scholarlly
//
//  Created by student on 8/16/24.
//

import Foundation

struct Majors: Decodable {
    let catagory: String
    let major: String
    let major_id: String
    
    //initilaize
    init(catagory: String, major: String, major_id: String) {
        self.catagory = catagory
        self.major = major
        self.major_id = major_id
        }
}

class MajorManager {
    static let shared = MajorManager()
    
    var majorslist: Majors?
    
    private init() {}
}

