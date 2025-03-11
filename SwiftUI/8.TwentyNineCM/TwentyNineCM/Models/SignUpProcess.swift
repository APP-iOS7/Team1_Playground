//
//  SignUpProcess.swift
//  TwentyNineCM
//
//  Created by 맨태 on 2/28/25.
//

import Foundation
import Observation

@Observable
final class SignUpProcess {
    static let shared: SignUpProcess = SignUpProcess()
    
    var currentIndex: Float = 1.0
    var endIndex: Float = 3.0
    var user: User = User()
    
    private init() {}
}
