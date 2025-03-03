//
//  InterestManager.swift
//  Scholarlly
//
//  Created by student on 8/17/24.
//

import Foundation

struct interestlist: Decodable {
    let interest: String
    
    //initilaize
    init(interest: String) {
        self.interest = interest
        }
}

class InterestManager {
    static let shared = InterestManager()
    
    var interestslistt: interestlist?
    
    private init() {}
}
