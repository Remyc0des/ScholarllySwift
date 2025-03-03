//
//  LoginView.swift
//  Scholarlly
//
//  Created by student on 8/19/24.
//

import SwiftUI

@MainActor
final class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage: String? = nil
    func logIn() {
        // Perform the login call
        SignupManager.shared.logIn(email: email, password: password) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let studentID):
                    // Handle successful login, navigate to the main app view
                    print("Logged in student with ID: \(studentID)")
                    // Example: SessionManager.shared.logIn(studentID: studentID)
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
struct LoginView: View {
    @ObservedObject var lviewModel: LoginViewModel
    var body: some View {
        ZStack{
            Color.blue.ignoresSafeArea()
            VStack{
                TextField("Email", text: $lviewModel.email)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .autocapitalization(.none)
                TextField("Password", text: $lviewModel.password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .autocapitalization(.none)
                if let errorMessage = lviewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
                Button(action: {
                    lviewModel.logIn()
                }) {
                    Text("Log In")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.mint)
                        .cornerRadius(10)
                        
                    }
                }
            .padding()
            }
        }
    }

#Preview {
    LoginView(lviewModel: LoginViewModel())
}
