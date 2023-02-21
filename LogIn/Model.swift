//
//  Model.swift
//  LogIn
//
//  Created by macbook on 21.02.2023.
//

import Foundation
import FirebaseCore
import FirebaseAuth
import SwiftUI

class UserAPI {
    
    static func signInWithEmail(email: String, password: String, competion: @escaping (Bool, String) -> Void ) {
        Auth.auth().signIn(withEmail: email, password: password, completion: ({ (res, err) in
            
            if err != nil {
                competion(false, (err?.localizedDescription)!)
                return
            }
            
            competion(true, (res?.user.email)!)
        }))
    }

    static func signUpWithEmail(email: String, password: String, competion: @escaping (Bool, String) -> Void ) {
        Auth.auth().createUser(withEmail: email, password: password, completion: ({ (res, err) in
            
            if err != nil {
                competion(false, (err?.localizedDescription)!)
                return
            }
            
            competion(true, (res?.user.email)!)
        }))
    }

}

enum Keys: String {
    case user
    case userChange
}

extension NSNotification.Name {
    static let userChange = Notification.Name(Keys.userChange.rawValue)
}


    

