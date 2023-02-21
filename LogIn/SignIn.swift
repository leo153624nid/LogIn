//
//  SignIn.swift
//  LogIn
//
//  Created by macbook on 20.02.2023.
//

import SwiftUI

struct SignIn : View {
    
    @State var email = ""
    @State var pass = ""
    @State var message = ""
    @State var alert = false
    @State var show = false
    
    var body : some View {
        VStack {
            
            Text("Sign In")
                .fontWeight(.heavy)
                .font(.largeTitle)
                .padding([.top,.bottom], 20)
            
            VStack{
                
                VStack(alignment: .leading){
                    
                    VStack(alignment: .leading){
                        
                        Text("Username")
                            .font(.headline)
                            .fontWeight(.light)
                            .foregroundColor(Constants.blackOpacityColor)
                        
                        HStack{
                            
                            TextField("Enter Your Username", text: $email)
                            
                            if email != "" {
                                
                                Image(systemName: "checkmark").foregroundColor(Constants.greenColor)
                            }
                            
                        }
                        
                        Divider()
                        
                    }.padding(.bottom, 15)
                    
                    VStack(alignment: .leading){
                        
                        Text("Password")
                            .font(.headline)
                            .fontWeight(.light)
                            .foregroundColor(Constants.blackOpacityColor)
                        
                        HStack {
                            
                            SecureField("Enter Your Password", text: $pass)
                            
                            if pass.count >= Constants.passwordLenght {
                                
                                Image(systemName: "checkmark").foregroundColor(Constants.greenColor)
                            }
                        }
                        
                        Divider()
                        
                    }
                      
                }.padding(.horizontal, 6)
             
            }.padding()
            VStack{
                
                Button(action: {
                    
                    UserAPI.signInWithEmail(email: self.email, password: self.pass, competion: { (verified, status) in
                        
                        if !verified {
                            
                            self.message = status
                            self.alert.toggle()
                        }
                        else {
                            
                            UserDefaults.standard.set(self.email, forKey: Keys.user.rawValue)
                            NotificationCenter.default.post(name: .userChange, object: nil)
                        }
                    })
                    
                }) {
                    
                    Text("Sign In")
                        .foregroundColor(Constants.whiteColor)
                        .frame(width: Constants.buttonWidth)
                        .padding()
                    
                }.background(Constants.greenColor)
                .clipShape(Capsule())
                .padding(.top, 45)
                .alert(isPresented: $alert, content: {
                    
                    Alert(title: Text("Error"), message: Text(self.message), dismissButton: .default(Text("Ok")))
                })
            
                Text("(or)")
                    .foregroundColor(Constants.grayOpacityColor)
                    .padding(.top, 30)
                
                HStack(spacing: 8) {
                    
                    Text("Don't Have An Account ?")
                        .foregroundColor(Constants.grayOpacityColor)
                    
                    Button(action: {
                        
                        self.show.toggle()
                        
                    }) {
                        
                        Text("Sign Up")
                        
                    }.foregroundColor(Constants.blueColor)
                    
                }.padding(.top, 25)
                
            }.sheet(isPresented: $show, content: {
                
                SignUp(show: self.show)
                
            })
        }
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
