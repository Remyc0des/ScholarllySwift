//
//  BrowseView.swift
//  Scholarlly
//
//  Created by student on 8/21/24.
//

import SwiftUI

@MainActor



//final class BrowseViewModel: ObservableObject {
//  //  @Published var title = ""
//    @Published var description = ""
//    @Published var opp_type = ""
//    @Published var institution = ""
//    @Published var eligibility: [String] = []
//    @Published var match_score = nil
//    @Published var deadline = nil
//    @Published var tags: [String] = []
//
//publishing error, pls fix type annoying
final class BrowseViewModel: ObservableObject {
    @Published var programs: [Programs] = []

}
struct BrowseView: View {
    @StateObject private var bviewModel = BrowseViewModel()
    var body: some View {
        VStack {
            if bviewModel.programs.isEmpty {
                Text("loading programs")
                    .font(.headline)
            } else {
                
                    VStack {
                        ZStack{
                            ForEach(bviewModel.programs, id: \.self){program in
                                CardView(programtitle: program.title, programdescription: program.description, programopp_type: program.opp_type, programinst: program.institution, programeligibility: program.eligibility, programmatch_score: program.match_score,  programtags: program.tags)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background{
                        Color.ivory
                        .ignoresSafeArea()                    }
                }
            
            
        }
        .onAppear {
            listPrograms()
        }
    }
        func listPrograms() {
            
            guard let url = URL(string: "http://127.0.0.1:5000/oppertunites") else{return}
            var request = URLRequest(url:url)
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let task = URLSession.shared.dataTask(with: request){ data, response, error in
                if error != nil {
                    print("error fetching programs")
                    return
                }
                guard let data = data else {return}
                print("Fetched data", data)
                do{
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    let programs = try decoder.decode([Programs].self, from: data)
                    print("programs:",programs)
                    bviewModel.programs = programs
                } catch let jsonError {
                    print("failed to decode json", jsonError)
                }
            }
            task.resume()
        }
    }


#Preview {
    BrowseView()
}
