//
//  SignupManager.swift
//  Scholarlly
//
//  Created by student on 8/16/24.
//

import Foundation
import SwiftUI
final class SignupManager {
    
    static let shared = SignupManager()
    private init() { }
    //ScholarlyAPI = http://127.0.0.1:5000
    
    class SignupManager {
        
        func logUserOut() {
            SessionManager.shared.logOut()
        }
        
        func createStudent(student: Student, completion: @escaping (Result<Int, Error>) -> Void) {
            guard let url = URL(string: "http://127.0.0.1:5000/students") else { return }
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            do {
                let jsonData = try JSONEncoder().encode(student)
                request.httpBody = jsonData
                
                if let jsonString = String(data: jsonData, encoding: .utf8) {
                    print("Student data being sent: \(jsonString)")
                }
            } catch {
                completion(.failure(error))
                return
            }
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201 else {
                    let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid response"])
                    completion(.failure(error))
                    return
                }
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                       let studentID = json["student_id"] as? Int {
                        SessionManager.shared.logIn()
                        DispatchQueue.main.async {
                            completion(.success(studentID))
                            
                        }
                    } else {
                        let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid data"])
                        completion(.failure(error))
                    }
                } catch {
                    completion(.failure(error))
                }
            }
            
            task.resume()
        }
        func logIn(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
            guard let url = URL(string: "http://127.0.0.1:5000/login") else { return }
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let loginData = ["email": email, "password": password]
            
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: loginData, options: [])
                request.httpBody = jsonData
            } catch {
                completion(.failure(error))
                return
            }
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid credentials"])
                    completion(.failure(error))
                    return
                }
                
                // Login successful, perform any actions you need, like saving a session token
                SessionManager.shared.logIn()
                completion(.success(()))
            }
            
            task.resume()
            
        }
        
    }
}
