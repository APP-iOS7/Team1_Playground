//
//  CalendarModel.swift
//  Calendar
//
//  Created by 기은 on 2/11/25.
//
//  데이터 구조 정의

import SwiftUI

struct Day {
    let id = UUID()
    let date: Date
    let isToday: Bool
}
