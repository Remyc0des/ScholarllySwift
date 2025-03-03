//
//  SignupView.swift
//  Scholarlly
//
//  Created by student on 8/16/24.
//

import SwiftUI
import iPhoneNumberField

@MainActor

final class SignUpViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var phone = ""
    @Published var password = ""
    @Published var birthday = Date()
    @Published var grade = ""
    @Published var major = ""
    @Published var gender = ""
    @Published var race = ""
    @Published var interest: [String] = []
    @Published var majors: [String] = []
    @Published var interestlisttt: [String] = []
}

struct SignupView: View {
    @StateObject private var viewModel = SignUpViewModel()
    @State private var signupStep = 0
    
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            
            VStack{
                switch signupStep {
                case 0:
                    EmailView(viewModel: viewModel)
                case 1:
                    BirthdayView(viewModel: viewModel)
                case 2:
                    GenderView(viewModel: viewModel)
                case 3:
                    RaceView(viewModel: viewModel)
                case 4:
                    GradeView(viewModel: viewModel)
                case 5:
                    CollegeMajorView(viewModel: viewModel)
                case 6:
                    StudentInterestView(viewModel: viewModel)
                default:
                    EmailView(viewModel: viewModel)
                }
                
                Button(action:{
                    if signupStep < 6 {
                        signupStep += 1
                    } else {
                        createStudent()
                    }
                }) {
                    Text(signupStep == 6 ? "Finished!" : "Next")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(10)
                        
                }
                .padding()
            }
        }
    }
    
    private func createStudent() {
        let student = Student(
            name: viewModel.name,
            email: viewModel.email,
            phone: viewModel.phone,
            grade: viewModel.grade,
            birthday: viewModel.birthday,
            gender: viewModel.gender,
            race: viewModel.race,
            intended_major: viewModel.major,
            interest: viewModel.interest,
            password: viewModel.password
        )
        
         SignupManager.shared.createStudent(student: student) { result in switch result {
        case .success(let studentID):
            print("Student signed up with ID: \(studentID)")
            
        case .failure(let error):
            print("failed to sign up: \(error.localizedDescription)")
        }
        }
        }
}


struct EmailView: View {
    
    @ObservedObject var viewModel: SignUpViewModel
    
    var body: some View {
        VStack(){
            
            Text("Lets get you started")
                .font(.system(size:32, weight: .bold, design: .rounded))
            
            TextField("Name", text: $viewModel.name)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
            
            TextField("Email", text: $viewModel.email)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
            iPhoneNumberField("Phone", text: $viewModel.phone)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
            
            TextField("Password", text: $viewModel.password)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
            
            
            
        }
        .padding()
    }
}

struct BirthdayView: View {
    @ObservedObject var viewModel: SignUpViewModel
    var body: some View {
        VStack{
            Text("When's Your Birthday?")
                .font(.system(size:32, weight: .bold, design: .rounded))
            
            DatePicker("Birthday", selection: $viewModel.birthday, displayedComponents: [.date])
                .keyboardType(.numberPad)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
        }
        .padding()
    }
}

struct GenderView: View{
    @ObservedObject var viewModel: SignUpViewModel
    @State private var selectedGender: String? = nil
    var body: some View{
        
        VStack{
            Text("What gender do you identify as?")
                .font(.system(size:32, weight: .bold, design: .rounded))
            Button(action:{
                
                viewModel.gender = "male"
                selectedGender = "male"
                
                
            }) {
                Text("Male")
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background( selectedGender == "male" ? .mint : .white)
                    .cornerRadius(10)
                    }
            Button(action:{
                
                viewModel.gender = "female"
                selectedGender = "female"
            }) {
                Text("Female")
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background( selectedGender == "female" ? .mint : .white)
                    .cornerRadius(10)
                    }
            Button(action:{
                
                viewModel.gender = "non-binary"
                selectedGender = "non-binary"
            }) {
                Text("non-identifying")
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background( selectedGender == "non-binary" ? .mint : .white)
                    .cornerRadius(10)
                    }


                    
            }
            .padding()
        }
    }
struct RaceView: View{
    @ObservedObject var viewModel: SignUpViewModel
    @State private var selectedRace: String? = nil
    var body: some View{
        
        VStack{
            Text("What race do you identify as?")
                .font(.system(size:32, weight: .bold, design: .rounded))
            Button(action:{
                
                viewModel.race = "black"
                selectedRace = "black"
                
                
            }) {
                Text("Black")
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background( selectedRace == "black" ? .mint : .white)
                    .cornerRadius(10)
                    }
            Button(action:{
                
                viewModel.race = "white"
                selectedRace = "white"
            }) {
                Text("White")
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background( selectedRace == "white" ? .mint : .white)
                    .cornerRadius(10)
                    }
            Button(action:{
                
                viewModel.race = "asian"
                selectedRace = "asian"
            }) {
                Text("Asian")
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background( selectedRace == "asian" ? .mint : .white)
                    .cornerRadius(10)
                    }
            Button(action:{
                
                viewModel.race = "hispanic"
                selectedRace = "hispanic"
            }) {
                Text("Hispanic")
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background( selectedRace == "hispanic" ? .mint : .white)
                    .cornerRadius(10)
                    }


                    
            }
            .padding()
        }
    }

struct GradeView: View{
    @ObservedObject var viewModel: SignUpViewModel
    @State private var selectedGrade: String? = nil
    var body: some View{
        
        VStack{
            Text("What grade are you in?")
                .font(.system(size:32, weight: .bold, design: .rounded))
            Button(action:{
                
                viewModel.grade = "freshman"
                selectedGrade = "freshman"
                
                
            }) {
                Text("Freshman")
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background( selectedGrade == "freshman" ? .mint : .white)
                    .cornerRadius(10)
                    }
            Button(action:{
                
                viewModel.grade = "sophmore"
                selectedGrade = "sophmore"
            }) {
                Text("Sophmore")
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background( selectedGrade == "sophmore" ? .mint : .white)
                    .cornerRadius(10)
                    }
            Button(action:{
                
                viewModel.grade = "junior"
                selectedGrade = "junior"
            }) {
                Text("Junior")
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background( selectedGrade == "junior" ? .mint : .white)
                    .cornerRadius(10)
                    }
            Button(action:{
                
                viewModel.grade = "senior"
                selectedGrade = "senior"
            }) {
                Text("Senior")
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background( selectedGrade == "senior" ? .mint : .white)
                    .cornerRadius(10)
                    }


                    
            }
            .padding()
        }
    }


struct CollegeMajorView: View{
    @ObservedObject var viewModel: SignUpViewModel
    
    
    var body: some View {
        VStack{
            Text("What major are you interested in?")
                .font(.system(size:32, weight: .bold, design: .rounded))
            ScrollView {
                LazyVGrid(columns :[GridItem(.adaptive(minimum: 100))], spacing: 20) {
                    ForEach(viewModel.majors, id: \.self) { major in
                        MajorBubbleview(major: major, isSelected: viewModel.major == major)
                            .onTapGesture{
                                viewModel.major = major
                            }
                    }
                }
                .padding()
            }
        }
        .padding()
        .onAppear {
            listMajors()
        }
    }
    func listMajors(){
        guard let url = URL(string: "http://127.0.0.1:5000/majors") else{return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request){ data, response, error in
            if error != nil {
                print("error fetching majors")
                return
            }
            guard let data = data else {return}
            do {
                let majors = try JSONDecoder().decode([Majors].self, from: data)
                DispatchQueue.main.async {
                    viewModel.majors = majors.map { $0.major }
                }
            } catch let jsonError {
                print("failed to decode json", jsonError)
            }
            
        }
        task.resume()
    }
    struct Major: Decodable {
        let major: String
    }
}
    struct MajorBubbleview: View {
        let major: String
        let isSelected: Bool
        
        var body: some View {
            Text(major)
                .font(.headline)
                .padding()
                .background(isSelected ? Color.green : Color.white)
                .foregroundColor(isSelected ? .white : .black)
                .cornerRadius(20)
                .overlay( RoundedRectangle(cornerRadius: 20)
                    .stroke(isSelected ? Color.mint : Color.gray, lineWidth: 2)
                )
                .frame(maxWidth: .infinity)
        }
    }

struct StudentInterestView: View {
    @ObservedObject var viewModel: SignUpViewModel
    
    var body: some View {
        VStack {
            Text("What are your interest wants and traits?")
                .font(.system(size:32, weight: .bold, design: .rounded))
            ScrollView {
                LazyVGrid(columns :[GridItem(.adaptive(minimum: 100))], spacing: 20) {
                    ForEach(viewModel.interestlisttt, id: \.self) { interest in
                        InterestBubbleview(interest: interest, isSelected: viewModel.interest.contains(interest))
                            .onTapGesture{
                                toggleInterest(interest)
                            }
                    }
                }
                .padding()
            }
            
        }
        .padding()
        .onAppear{
            listInterest()
        }
    }
    private func toggleInterest(_ interest:String) {
        if let index = viewModel.interest.firstIndex(of: interest) {
            viewModel.interest.remove(at: index)
        } else { viewModel.interest.append(interest)}
    }
    func listInterest(){
        guard let url = URL(string: "http://127.0.0.1:5000/interest") else{return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request){ data, response, error in
            if let error = error {
                print("error fetching interests")
                return
            }
            guard let data = data else {return}
            do {
                let interestList = try JSONDecoder().decode([interestlist].self, from: data)
                DispatchQueue.main.async {
                    viewModel.interestlisttt = interestList.map { $0.interest }
                }
            } catch let jsonError {
                print("failed to decode json", jsonError)
            }
            
        }
        task.resume()
    }
    struct Interest: Decodable {
        let interest: String
    }
}
    struct InterestBubbleview: View {
        let interest: String
        let isSelected: Bool
        
        var body: some View {
            Text(interest)
                .font(.headline)
                .padding()
                .background(isSelected ? Color.green : Color.white)
                .foregroundColor(isSelected ? .white : .black)
                .cornerRadius(20)
                .overlay( RoundedRectangle(cornerRadius: 20)
                    .stroke(isSelected ? Color.mint : Color.gray, lineWidth: 2)
                )
                .frame(maxWidth: .infinity)
        }
    }
    
        






#Preview {
    SignupView()
}
