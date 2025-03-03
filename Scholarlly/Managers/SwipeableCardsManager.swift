//
//  SwipeableCardsManager.swift
//  Scholarlly
//
//  Created by student on 9/11/24.
//

import Foundation



func pullAllPrograms(){
    
    struct Program: Decodable {
        let title: String
        let description: String
        let opp_typle: String
        let institution: String
        let eligibility: [String]
        let match_score: Int
        let deadline: Date
        let tags: [String]
    }

    guard let url = URL(string: "http://127.0.0.1:5000")
        else{return}
    var request = URLRequest(url:url)
    request.httpMethod = "GET"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let task = URLSession.shared.dataTask(with: request){ data, response, error in
        if let error = error {
            print("error fetching majors")
            return
        }
        guard let data = data else {return}
        do {
            let programs = try JSONDecoder().decode([Programs].self, from: data)
           
        } catch let jsonError {
            print("failed to decode json", jsonError)
        }
    }
    task.resume()
}


