//
//  ContentView.swift
//  LogIn
//
//  Created by macbook on 20.02.2023.
//

import SwiftUI

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

