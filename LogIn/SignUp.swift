//
//  SignUp.swift
//  LogIn
//
//  Created by macbook on 20.02.2023.
//

import SwiftUI

struct SignUp : View {
    
    @State var email = ""
    @State var pass = ""
    @State var message = ""
    @State var alert = false
    @State var show = false
    
    var body : some View {
        VStack {
            
            Text("Sign Up")
                .fontWeight(.heavy)
                .font(.largeTitle)
                .padding([.top,.bottom], 20)
            
            VStack{
                
                VStack(alignment: .leading){
                    
                    VStack(alignment: .leading){
                        
                        Text("Username")
                            .font(.headline)
                            .fontWeight(.light)
                            .foregroundColor(Color.init(.label).opacity(0.75))
                        
                        HStack{
                            
                            TextField("Enter Your Username", text: $email)
                            
                            if email != "" {
                                
                                Image(systemName: "checkmark").foregroundColor(Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)))
                            }
                            
                        }
                        
                        Divider()
                        
                    }.padding(.bottom, 15)
                    
                    VStack(alignment: .leading){
                        
                        Text("Password")
                            .font(.headline)
                            .fontWeight(.light)
                            .foregroundColor(Color.init(.label).opacity(0.75))
                        
                        HStack {
                            
                            SecureField("Enter Your Password", text: $pass)
                            
                            if pass.count >= 6 {
                                
                                Image(systemName: "checkmark").foregroundColor(Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)))
                            }
                        }
                        
                        Divider()
                        
                    }
                      
                }.padding(.horizontal, 6)
             
            }.padding()
            
            VStack{
                
                Button(action: {
                    
                    signUpWithEmail(email: self.email, password: self.pass, competion: { (verified, status) in
                        
                        if !verified {
                            
                            self.message = status
                            self.alert.toggle()
                        }
                        else {
                            
                            UserDefaults.standard.set(self.email, forKey: "user")
                            self.show.toggle()
                        }
                    })
                    
                }) {
                    
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 120)
                        .padding()
                    
                }.background(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                .clipShape(Capsule())
                .padding(.top, 45)
                .alert(isPresented: $alert, content: {
                    
                    Alert(title: Text("Error"), message: Text(self.message), dismissButton: .default(Text("Ok")))
                })
            
            }
        }
    }
}


struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
