//
//  OnboardingView.swift
//  Scholarlly
//
//  Created by student on 8/16/24.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        NavigationStack{
            ZStack {
                Color.blue.ignoresSafeArea()
                VStack{
                    
                    
                    
                    Text("Find something to do Elevate yourself ")
                    NavigationLink(destination: SignupView()) {
                        Text("Sign Up")
                            .font(.headline)
                            .foregroundColor(.black)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.mint)
                            .cornerRadius(10)
                    }
                    .padding()
                    NavigationLink(destination: LoginView(lviewModel: LoginViewModel())) {
                        Text("Log In")
                            .font(.headline)
                            .foregroundColor(.black)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.mint)
                            .cornerRadius(10)
                    }
                    .padding()
                    
                    
                    
                    
                }
            }
        }
    }
}

#Preview {
    OnboardingView()
}
