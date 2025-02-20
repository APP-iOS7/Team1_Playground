//
//  Item.swift
//  Practice1_0211
//
//  Created by 최하진 on 2/11/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
