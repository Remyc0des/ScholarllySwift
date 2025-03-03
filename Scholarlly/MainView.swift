//
//  MainView.swift
//  Scholarlly
//
//  Created by student on 8/16/24.
//

import SwiftUI


struct MainView: View {
    var body: some View {
        
        TabView {
            StudentHomeView()
                .tabItem() {
                    Image(systemName: "phone.fill")
                }
            RecomendationView()
                .tabItem() {
                    Image(systemName: "person.2.fill")
                        }
            BrowseView()
                .tabItem() {
                    Image(systemName: "slider.horizontal.3")
                    }
            SearchView()
                .tabItem() {
                    Image(systemName:"person.2.fill")
                }
            
            }
        }
    }


#Preview {
    MainView()
}
