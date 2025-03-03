//
//  ContentView.swift
//  Scholarlly
//
//  Created by student on 8/16/24.
//

import SwiftUI



struct ContentView: View {
    @ObservedObject var sessionManager = SessionManager.shared
    
    init () {
        
        //first launch
        if !UserDefaults.standard.bool(forKey: "isFirstLaunch") {
            UserDefaults.standard.set(true, forKey: "isFirstLaunch")
        } else {
            sessionManager.setFirstLaunch(false)
        }
        
        //user login
        if UserDefaults.standard.bool(forKey: "UserLoggedIn") {
            sessionManager.setCurrentState(.LoggedIn)
        } else {
            sessionManager.setCurrentState(.LoggedOut)
        }
    }

    var body: some View {
        if sessionManager.firstLaunch {
            OnboardingView()
        } else if sessionManager.currentState == .LoggedIn {
            MainView()
        } else  {
            OnboardingView()
        }
    }
}

#Preview {
    ContentView()
}
