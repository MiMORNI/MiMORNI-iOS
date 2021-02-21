//
//  MiMORNiService.swift
//  MiMORNI-iOS
//
//  Created by Suji Kim on 2/21/21.
//  Copyright © 2021 sjkim. All rights reserved.
//

import Moya

enum MiMORNiService {
    case addUserName(username: String, wakeTime:String, sleepTime:String, durationInMonths: Int, goals:[String:[String:Bool]])
    case updateGoals(username: String, goals:[String:Bool])
    case uploadImage(image:Data)
    case getGroupInfo
}

extension MiMORNiService:TargetType {
    var sampleData: Data {
        return Data()
    }
    
    var baseURL: URL { return URL(string: "https://mimorni.wl.r.appspot.com/")!}
    var path: String { // 서버에 던져줄 주소 값
        switch self {
        case .addUserName:
            return "/api/users/createUser"
        case .updateGoals(let username, let goals):
            return "/api/users/updateUserGoals/\(username)"
        case .uploadImage:
            return "/api/media/uploadImage"
        case .getGroupInfo:
            return "/api/communities/getCommunity/percentComplete"
        }
    }
    
    var method: Moya.Method { // get, post, put, delete
        switch self {
        case .addUserName, .uploadImage:
            return .post
        case .updateGoals:
            return .put
        case .getGroupInfo:
            return .get
        }
    }
    var task: Task {
        switch self {
        case .addUserName(let username, let wakeTime, let sleepTime, let durationInMonths, let goals):
            return .requestParameters(parameters: ["username": username, "wakeTime":wakeTime, "sleepTime":sleepTime, "durationInMonths":durationInMonths, "goals":goals], encoding: JSONEncoding.default)
        case .updateGoals(let username, let goals):
            return .requestParameters(parameters: ["goals":goals], encoding: JSONEncoding.default)
        case .uploadImage(let image):
            let imgData = MultipartFormData(provider: .data(image), name:"miracle", fileName: "jpg.jpg", mimeType: "image/jpg")
            let multipartData = [imgData]
            return .uploadMultipart(multipartData)
        case .getGroupInfo:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
