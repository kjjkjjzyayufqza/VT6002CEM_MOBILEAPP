//
//  LoginVie.swift
//  MJ_APP
//
//  Created by admin on 9/1/2023.
//

import SwiftUI

struct UserData : Identifiable, Decodable{
    var id:String = ""
    var email:String = ""
    var password:String = ""
}

struct LoginView: View {
    
    @State var isClickLogin = false
    @State var email:String = ""
    @State var password:String = ""
    
    @State var isActive_register = false
    @State var isActive_main = false
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Authorization.entity(), sortDescriptors: [], predicate: nil) var authorizationData: FetchedResults<Authorization>
    
    var network = Network()
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(hex: "FFFFFF").edgesIgnoringSafeArea(.all)
                VStack{
                    Spacer()
                    Text("AR-Mahjong")
                        .font(.title)
                        .fontWeight(.bold)
                    Image("loginPageIcon")
                        .resizable()
                        .frame(width: 200, height: 200)
                    
                    Spacer()
                    
                    if !isClickLogin{
                        largeBtn(title: "Sign in", backgroudColor: "007EFB", textColor: "FFFFFF", onClick: {
                            
                            isClickLogin = true
                        })
                        
                        
                        largeBtn(title: "Guest", backgroudColor: "FFFFFF", textColor: "000000", onClick: {
                            isActive_main = true
                            
                        })
                    }
                    
                    if isClickLogin{
                        VStack{
                            Text("Back")
                                .foregroundColor(.blue)
                                .onTapGesture {
                                    isClickLogin = false
                                }
                            SecureField("Email",text: $email)
                                .font(.title3)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(.white)
                                .cornerRadius(50)
                                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                            
                            SecureField("Password",text: $password)
                                .font(.title3)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(.white)
                                .cornerRadius(50)
                                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                            largeBtn(title: "Login", backgroudColor: "007EFB", textColor: "FFFFFF", onClick: {
                                network.getUsers()
                            })
                            
                            
                            
                        }
                    }
                    
                    HStack{
                        Text("Not Account?")
                        Text("Register")
                            .foregroundColor(Color(hex: "007EFB"))
                            .onTapGesture {
                                isActive_register = true
                            }
                    }
                    FooterView()
                }
                .padding()
                
            }
            .navigationDestination(isPresented: $isActive_main) {
                MainView().navigationBarBackButtonHidden(true)
            }
            .navigationDestination(isPresented: $isActive_register) {
                RegisterView()
                
            }
        }
        
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


class Network: ObservableObject {
    @Published var users: [UserData] = []

    func getUsers() {
        guard let url = URL(string: "https://moovoo-backend.azurewebsites.net/api/VT6002CEMControllers") else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedUsers = try JSONDecoder().decode([UserData].self, from: data)
                        self.users = decodedUsers
                        print(decodedUsers)
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
    
    func createUsers(email:String,password:String) {
        guard let url = URL(string: "https://moovoo-backend.azurewebsites.net/api/VT6002CEMControllers") else { fatalError("Missing URL") }
        
        let body: [String: Any] = ["data": ["email": email, "password": password]]
                
                let jsonData = try? JSONSerialization.data(withJSONObject: body)

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = jsonData

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedUsers = try JSONDecoder().decode([UserData].self, from: data)
                        self.users = decodedUsers
                        print(decodedUsers)
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
}
