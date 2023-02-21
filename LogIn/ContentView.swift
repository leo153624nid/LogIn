//
//  ContentView.swift
//  LogIn
//
//  Created by macbook on 20.02.2023.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

struct ContentView: View {
    @State var userName = UserDefaults.standard.value(forKey: "user") as? String ?? ""
    
    var body: some View {
        
        VStack {
            
            if userName != "" {
                
                HomeView(name: $userName) // todo
                
            }
            else {
                
                SignIn()
                
            }
           
        }.animation(.spring())
        .onAppear {
            
            NotificationCenter.default.addObserver(forName: NSNotification.Name("userChange"), object: nil, queue: .main, using: { _ in
                
                self.userName = UserDefaults.standard.value(forKey: "user") as? String ?? ""
            })
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func signInWithEmail(email: String, password: String, competion: @escaping (Bool, String) -> Void ) {
    Auth.auth().signIn(withEmail: email, password: password, completion: ({ (res, err) in
        
        if err != nil {
            competion(false, (err?.localizedDescription)!)
            return
        }
        
        competion(true, (res?.user.email)!)
    }))
}

func signUpWithEmail(email: String, password: String, competion: @escaping (Bool, String) -> Void ) {
    Auth.auth().createUser(withEmail: email, password: password, completion: ({ (res, err) in
        
        if err != nil {
            competion(false, (err?.localizedDescription)!)
            return
        }
        
        competion(true, (res?.user.email)!)
    }))
}
