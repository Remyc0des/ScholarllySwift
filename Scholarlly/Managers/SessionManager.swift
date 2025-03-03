//
//  SessionManager.swift
//  Scholarlly
//
//  Created by student on 8/16/24.
//

import Foundation

final class SessionManager: ObservableObject {
    
    static let shared = SessionManager()
    
    enum CurrentState {
        case LoggedIn
        case LoggedOut
    }
    
    @Published var currentState: CurrentState = .LoggedOut
    @Published var firstLaunch: Bool = false
    
    func setCurrentState(_ state: CurrentState){
        currentState = state
    }
    
    func setFirstLaunch(_ isFirstLaunch: Bool) {
        firstLaunch = isFirstLaunch
    }
    
    func logIn() {
        DispatchQueue.main.async {
            self.currentState = .LoggedIn
            UserDefaults.standard.set(true,forKey: "UserLoggedIn")
        }
    }
    
    func logOut() {
        currentState = .LoggedOut
        UserDefaults.standard.set(false, forKey: "UserLoggedIn")
    }
    
    private init() { }
}
