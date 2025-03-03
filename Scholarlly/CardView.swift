//
//  CardView.swift
//  Scholarlly
//
//  Created by student on 9/13/24.
//

import SwiftUI


struct CardView: View {
    @StateObject private var bviewModel = BrowseViewModel()
    let programtitle: String
    let programdescription: String
    let programopp_type: String
    let programinst: String
    let programeligibility: [String]
    let programmatch_score: Int?
    
    let programtags: [String]
    
    @State private var offset = CGSize.zero
    @State var cardshadow = Color.black
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .padding(-20)
                .frame(width: 345, height:600)
                .cornerRadius(29)
                .foregroundColor(Color.ivory)
                .shadow(color: cardshadow, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            VStack(spacing: -1) {
                
//                Rectangle()
//                    .fill(LinearGradient(colors: [.lightGreen, .midGreen, .darkGreen], startPoint: .top, endPoint: .bottom))
//                    .frame(width: 345.9, height: 205)
//                    .cornerRadius(16)
//                    .position(x:196, y:232)
//                    .shadow(radius: 5)
                
                titleTextWithBorder(text:programtitle, backgroundColor: (LinearGradient(colors: [.lightGreen, .midGreen, .darkGreen], startPoint: .top, endPoint: .bottom)))
                    
                    .frame(maxWidth:340)
                    .font(.custom("BigCity Grotesque Pro", size: 70))
                    
                
                
                Text(programdescription)
                    
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth:300)
                    .font(.custom("BIZUDPGOTHIC",size:15))
                    
                
                VStack {
                    
                    Text("Eligibality")
                        
                        .font(.custom("BigCity Grotesque Pro", size:20))
                    
                    HStack {
                        ForEach(programeligibility.prefix(3), id: \.self) { elig in
                            dynamicTextWithBorder(text: elig, backgroundColor: (LinearGradient(colors: [.lightGreen, .midGreen, .darkGreen], startPoint: .top, endPoint: .bottom)))
                                .font(.custom("BigCity Grotesque Pro", size:10))
                        }

                    }
                }
                
                    
                VStack {
                    
                    Text("Tags")
                        .font(.custom("BigCity Grotesque Pro", size:20))
                        
                    HStack {
                        
                        ForEach(programtags.prefix(3), id: \.self) { tag in
                            dynamicTextWithBorder(text: tag, backgroundColor: (LinearGradient(colors: [.lightGreen, .midGreen, .darkGreen], startPoint: .top, endPoint: .bottom)))
                                .font(.custom("BigCity Grotesque Pro", size:10))
                        }
                    }.padding(.bottom, 15)
                    
                    
                    
                }.padding()
                

                
                
                
            }.padding(.bottom, 50)
            
        }.padding()
        
        .offset(x: offset.width, y: offset.height * 0.4)
        .rotationEffect(.degrees(Double(offset.width / 40)))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                    changeColor(width: offset.width)
                } .onEnded{ _ in
                    withAnimation {
                        swipeCard(width: offset.width)
                        
                    }
                }
        )
    }
        func swipeCard(width: CGFloat) {
            switch width {
            case -500...(-150):
                print("card removed")
                offset = CGSize(width: -500, height: 0)
            case 150...500:
                print("card added")
                offset = CGSize(width: 500, height: 0)
            default:
                offset = .zero
            }
        }
     func changeColor(width: CGFloat) {
         let swipeThreshold: CGFloat = 100
         if width > swipeThreshold {
             cardshadow = Color.lightGreen
         } else if width < -swipeThreshold {
             cardshadow = Color.red
         } else { cardshadow = Color.black }
        
            
        }
    }
    

    

    
    
    
    @ViewBuilder
    func dynamicTextWithBorder(text: String, backgroundColor: LinearGradient) -> some View {
        Text(text)
            .font(.custom("BigCity Grotesque Pro", size: 9))
            .padding(.horizontal, 2) // Padding around the text
            .padding(.vertical, 2)
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .fill(backgroundColor)
            )
            .fixedSize(horizontal: true, vertical: true)
    }
func titleTextWithBorder(text: String, backgroundColor: LinearGradient) -> some View {
    Text(text)
        .font(.custom("BigCity Grotesque Pro", size: 50))
        .frame(maxHeight: 210)
        .frame(maxWidth:300)
        .padding(.horizontal, 5) // Padding around the text
        .padding(.vertical, 3)
        
    
        .background(
            RoundedRectangle(cornerRadius: 29)
                .fill(backgroundColor)
        )
        
}

    



