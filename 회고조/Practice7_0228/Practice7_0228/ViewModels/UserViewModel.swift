//
//  ContentViewModels.swift
//  Practice7_0228
//
//  Created by 최하진 on 2/28/25.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
    
    func allAgree() {
        if user.isAllagree {
            user.is14 = true
            user.isAd = true
            user.isPrivate = true
            user.isService = true
        } else {
            user.is14 = false
            user.isAd = false
            user.isPrivate = false
            user.isService = false
        }
    }
    func someAgree() {
        if user.is14 && user.isAd && user.isPrivate && user.isService {
            user.isAllagree = true
        } else {
            user.isAllagree = false
        }
    }
    
    func nextAgree() -> Bool {
        return user.is14 && user.isPrivate && user.isService
    }
    
    func nextId() -> Bool {
        return user.id != ""
    }
    
    func nextPassword(_ passCheck: String) -> Bool {
        return  user.password != "" && user.password == passCheck &&  self.ispassEng() && self.ispassNum() && self.ispassCount()
    }
    func ispassEng() -> Bool {
        var p = false
        if user.password.isEmpty {
            return p
        } else {
            for i in user.password {
                if (Int(exactly: i.asciiValue!)! >= 65 && Int(exactly: i.asciiValue!)! <= 90) || (Int(exactly: i.asciiValue!)! >= 97 && Int(exactly: i.asciiValue!)! <= 122) {
                    p = true
                }
            }
            return p
        }
    }
    
    func ispassNum() -> Bool {
        var p = false
        if user.password.isEmpty {
            return p
        } else {
            for i in user.password {
                if Int(exactly: i.asciiValue!)! >= 48 && Int(exactly: i.asciiValue!)! <= 57 {
                    p = true
                }
            }
            return p
        }
    }
    
    func ispassCount() -> Bool {
        if user.password.isEmpty {
            return false
        } else {
            return user.password.count >= 8 && user.password.count <= 20
        }
        
    }
}
