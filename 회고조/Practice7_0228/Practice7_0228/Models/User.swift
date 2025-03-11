//
//  Item.swift
//  Practice7_0228
//
//  Created by 최하진 on 2/28/25.
//

import Foundation
import SwiftData

@Model
final class User: Identifiable {
    var id: String = ""
    var password: String = ""
    var isAllagree: Bool = false
    var is14: Bool = false
    var isService: Bool = false
    var isPrivate: Bool = false
    var isAd: Bool = false
    
    init(_ isAllagree: Bool = false) {
        self.isAllagree = isAllagree
    }
    
    
}
