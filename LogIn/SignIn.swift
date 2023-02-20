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
             Text("Sign In").fontWeight(.heavy).font(.largeTitle).padding([.top,.bottom], 20)
            VStack{
                
                VStack(alignment: .leading){
                    
                    VStack(alignment: .leading){
                        
                        Text("Username").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                        
                        HStack{
                            
                            TextField("Enter Your Username", text: $email)
                            
                            if email != "" {
                                
                                Image(systemName: "checkmark").foregroundColor(Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)))
                            }
                            
                        }
                        
                        Divider()
                        
                    }.padding(.bottom, 15)
                    
                    VStack(alignment: .leading){
                        
                        Text("Password").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                        
                        HStack {
                            
                            SecureField("Enter Your Password", text: $pass)
                            
                            if pass.count >= 6 {
                                
                                Image(systemName: "checkmark").foregroundColor(Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)))
                            }
                        }
                        
                        Divider()
                        
                        Text("description TODO").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                        
                    }
                      
                }.padding(.horizontal, 6)
             
            }.padding()
            VStack{
                
                Button(action: {
                    
                    signInWithEmail(email: self.email, password: self.pass, competion: ({ (verified, status) in
                        
                        if !verified {
                            
                            self.message = status
                            self.alert.toggle()
                        }
                        else {
                            
                            UserDefaults.standard.set(true, forKey: "status")
                            NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                        }
                    }))
                    
                }) {
                    
                    Text("Sign In").foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 120).padding()
                    
                }.background(Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)))
                .clipShape(Capsule())
                .padding(.top, 45)
                .alert(isPresented: $alert, content: {
                    
                    Alert(title: Text("Error"), message: Text(self.message), dismissButton: .default(Text("Ok")))
                })
            
                Text("(or)").foregroundColor(Color.gray.opacity(0.5)).padding(.top,30)
                
                HStack(spacing: 8){
                    
                    Text("Don't Have An Account ?").foregroundColor(Color.gray.opacity(0.5))
                    
                    Button(action: {
                        
                    }) {
                        
                        Text("Sign Up")
                        
                    }.foregroundColor(.blue)
                    
                }.padding(.top, 25)
            }
        }
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
