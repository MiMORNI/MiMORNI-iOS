//
//  GroupInfoResponse.swift
//  MiMORNI-iOS
//
//  Created by Suji Kim on 2/21/21.
//  Copyright © 2021 sjkim. All rights reserved.
//

import Foundation
struct GroupInfoResponse: Codable{
    let percentCompleteCommunity: Double
    let users: [User]
}

struct User:Codable {
    let username: String
    let durationInMonths: Int
    let wakeTime:String
    let sleepTime: String
    let images: [String]
    let goals: [String:[String:Bool]]
}
