//
//  ProflieView.swift
//  Scholarlly
//
//  Created by student on 8/21/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack{
            Color.ivory
                .ignoresSafeArea()
            
            Button("log out", action: SignupManager.shared.logUserOut)
        }
    }
}

#Preview {
    ProfileView()
}
