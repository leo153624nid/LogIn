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
            
            Text("Hello, \(name)!")
            
            Button(action: {
                
            }, label: {
                Text("LogOut")
            })
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(name: .constant("name"))
    }
}
