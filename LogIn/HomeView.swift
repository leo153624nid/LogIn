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
            
            Text("Hello, \(name)!").fontWeight(.heavy).font(.largeTitle).padding(20)
            
            Spacer()
            
            Button(action: {
                
                UserDefaults.standard.set(false, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                
            }, label: {
                
                Text("LogOut").foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 120).padding()
            })
            .background(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
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
