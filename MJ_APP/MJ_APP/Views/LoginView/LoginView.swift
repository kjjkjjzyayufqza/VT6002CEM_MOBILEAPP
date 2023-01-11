//
//  LoginVie.swift
//  MJ_APP
//
//  Created by admin on 9/1/2023.
//

import SwiftUI

struct UserData : Identifiable, Decodable{
    let id:String = ""
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
    
    @State var showingAlert:Bool = false
    
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
                            let autData = Authorization(context: self.moc)
                            autData.userName = ""
                            autData.userPassword = ""
                            do {
                                try moc.save()
                            } catch {
                                
                            }
                        })
                    }
                    
                    if isClickLogin{
                        VStack{
                            Text("Back")
                                .foregroundColor(.blue)
                                .onTapGesture {
                                    isClickLogin = false
                                }
                            TextField("Email / User Name",text: $email)
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
                                Task{

                                    await network.getUsers()
                                    var maxCount = 0
                                    if(network.users.count > 0){
                                        for i in network.users{
                                            maxCount = maxCount + 1
                                            if i.email == email && i.password == password{
                                                print("login done")
                                                let autData = Authorization(context: self.moc)
                                                autData.userName = email
                                                autData.userPassword = password
                                                do {
                                                    try moc.save()
                                                } catch {
                                                    
                                                }
                                                isActive_main = true
                                                
                                                break
                                            }
                                        }
                                        if(maxCount == network.users.count && !isActive_main){
                                            print("login fail")
                                            showingAlert = true
                                        }
                                    }else{
                                        print("login fail")
                                        showingAlert = true
                                    }
                                }
                            }).alert(isPresented: $showingAlert) {
                                Alert(title: Text("Login Fail"), message: Text("The email or password is incorrect or the api server is not working properly, try logging in as a guest."), dismissButton: .default(Text("OK")))
                            }
                            
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
    
    
    func getUsers() async  {
        guard let url = URL(string: "https://moovoo-backend.azurewebsites.net/api/VT6002CEMControllers") else { fatalError("Missing URL") }
        do{
            let urlRequest = URLRequest(url: url)
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
            let decoded = try JSONDecoder().decode([UserData].self, from: data)
            self.users = decoded
        }catch{
            
        }
    }
    
    func createUsers(email:String,password:String) async {
        guard let url = URL(string: "https://moovoo-backend.azurewebsites.net/api/VT6002CEMControllers") else { fatalError("Missing URL") }
        
        let body: [String: Any] = ["email": email, "password": password]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        
        do{
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            urlRequest.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = jsonData
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
            let decoded = try JSONDecoder().decode([UserData].self, from: data)
            print(decoded)
            print("Create User done")
        }catch{
            print("Create User done")
        }
    }
}
