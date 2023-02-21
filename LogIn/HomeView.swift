//
//  HomeView.swift
//  LogIn
//
//  Created by macbook on 20.02.2023.
//

import SwiftUI

struct HomeView: View {
    @Binding var name : String
    
    var body: some View {
        
        VStack {
            Spacer()
            
            Text("Hello, \(name)!")
                .fontWeight(.heavy)
                .font(.largeTitle)
                .padding(20)
            
            Spacer()
            
            Button(action: {
                
                UserDefaults.standard.set("", forKey: Keys.user.rawValue)
                NotificationCenter.default.post(name: .userChange, object: nil)
                
            }, label: {
                
                Text("LogOut")
                    .foregroundColor(Constants.whiteColor)
                    .frame(width: Constants.buttonWidth)
                    .padding()
            })
            .background(Constants.blueColor)
            .clipShape(Capsule())
            
            Spacer()
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(name: .constant("name@gmail.com"))
    }
}
