//
//  MainView.swift
//  Scholarlly
//
//  Created by student on 8/16/24.
//

import SwiftUI


struct MainView: View {
    var body: some View {
       
                ZStack{
                    
                    TabView {
                        
                        
                    
                        BrowseView()
                            .tabItem() {
                                Image(systemName: "slider.horizontal.3")
                            }
                        ProfileView()
                            .tabItem() {
                                Image(systemName:"person.2.fill")
                                }
                            }
                    
                    
                    
                    }
        
                }
    
            }


#Preview {
    MainView()
}
