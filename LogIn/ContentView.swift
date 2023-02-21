//
//  ContentView.swift
//  LogIn
//
//  Created by macbook on 20.02.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var userName = UserDefaults.standard.value(forKey: Keys.user.rawValue) as? String ?? ""
    
    var body: some View {
        
        VStack {
            
            if userName != "" {
                
                HomeView(name: $userName)
                
            }
            else {
                
                SignIn()
                
            }
           
        }.animation(.spring())
        .onAppear {
            
            NotificationCenter.default.addObserver(forName: .userChange, object: nil, queue: .main, using: { _ in
                
                self.userName = UserDefaults.standard.value(forKey: Keys.user.rawValue) as? String ?? ""
            })
            
        }
    }
}

struct Constants {
    static let greenColor = Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
    static let blueColor = Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
    static let whiteColor = Color.white
    static let grayOpacityColor = Color.gray.opacity(0.5)
    static let blackOpacityColor = Color.init(.label).opacity(0.75)
    
    static let passwordLenght = 6
    static let buttonWidth = UIScreen.main.bounds.width - 120
     
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

