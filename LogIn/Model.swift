//
//  Model.swift
//  LogIn
//
//  Created by macbook on 21.02.2023.
//

import Foundation
import FirebaseCore
import FirebaseAuth

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

struct Constants {
    static let whiteColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    static let yellowColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
    static let lightGreyColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9607843137, alpha: 1)
    static let darkGreyColor = #colorLiteral(red: 0.5882352941, green: 0.5843137255, blue: 0.6078431373, alpha: 1)
    static let blackColor = #colorLiteral(red: 0.1921568627, green: 0.1921568627, blue: 0.1921568627, alpha: 1)
    static let minHeightDetailView : CGFloat = 360
    static let heightCarouselItem : CGFloat = 50
    
}
    
