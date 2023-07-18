//
//  RecieveData.swift
//  Umbba-iOS
//
//  Created by 최영린 on 2023/07/18.
//

class RecieveData{
    static let shared = RecieveData()
    
    var userInfo: User
    var onboardingAnswerList: [String]
    
    init() {
        self.userInfo = User.shared
        self.isInvitorChild = false
        self.relationInfo = ""
        self.pushTime = ""
        self.onboardingAnswerList = []
    }
}

class User {
    static let shared = User()
    
    var name: String
    var gender: String
    var bornYear: Int
    
    init() {
        self.name = ""
        self.gender = ""
        self.bornYear = 0
    }
    
    init(name: String, gender: String, bornYear: Int) {
        self.name = name
        self.gender = gender
        self.bornYear = bornYear
    }
}
