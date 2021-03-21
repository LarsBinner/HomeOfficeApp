//
//  ContentView.swift
//  HomeOfficeApp
//
//  Created by Lars Binner on 21.03.21.
//


import SwiftUI
import Firebase
import FirebaseAuth

struct ContentView: View {
    
    @State var mail = ""
    @State var pw = ""
    @State var color = Color(.systemBlue).opacity(0.3)
    @State var show = false
    @State var alert = false
    @State var loginSuccess = false

var body: some View {
    NavigationView {
        if loginSuccess == false {
                VStack {
                    Text("Homeoffice App")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Image("Logo")
                        .resizable()
                        .frame(width: 300, height: 300, alignment: .center)
                    Spacer()
                    Text("Logge dich hier ein")
                        .font(.title2)
                    TextField("Email Adresse", text: self.$mail)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 30).stroke(self.mail != "" ? Color(.systemBlue):self.color,lineWidth: 3))
                        .disableAutocorrection(true)
                    HStack {
                        if self.show == false {
                            SecureField("Passwort", text: self.$pw)
                        }
                        else {
                            TextField("Passwort", text: self.$pw)
                            }
                        
                        Button(action: {
                            self.show.toggle()
                        })
                        {
                            Image(systemName: self.show ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(Color(.systemBlue))
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 30).stroke(self.pw != "" ? Color(.systemBlue):self.color,lineWidth: 3))
                    
                    Button(action: {
                        login {
                            loginSuccess = true
                        }
                    })
                    {
                        Text("Einloggen")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .frame(width: UIScreen.main.bounds.width - 70)
                            .foregroundColor(Color(.white))
                    }
                    .padding()
                    .background(Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)))
                    .cornerRadius(30)
                    .background(RoundedRectangle(cornerRadius: 30))
                    
                    Spacer()
                }
                .padding()
            }
            else {
                NavigationLink(destination: HomeScreenView()){
                    Text("Du hast dich erfolgreich eingeloggt")
                }
            }
        }
}
    func login(completion: @escaping () -> Void) {
        Auth.auth().signIn(withEmail: mail, password: pw) { (result, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            else{
                print("Erfolgreich eingeloggt")
                loginSuccess = true
            }
        }
    }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

