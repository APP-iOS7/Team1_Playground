//
//  Diary.swift
//  Diary
//
//  Created by 맨태 on 2/26/25.
//

import Foundation

struct Diary: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var content: String
    var date: String
}
