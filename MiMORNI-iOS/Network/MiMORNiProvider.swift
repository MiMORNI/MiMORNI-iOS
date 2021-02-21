//
//  MiMORNiProvider.swift
//  MiMORNI-iOS
//
//  Created by Suji Kim on 2/21/21.
//  Copyright © 2021 sjkim. All rights reserved.
//

import Moya

class MiMORNiProvider {
    let provider = MoyaProvider<MiMORNiService>()

    func addUserName(username: String, wakeTime:String, sleepTime:String, durationInMonths: Int, goals:[String:[String:Bool]], completion: @escaping ((Data?) -> Void), failure: @escaping ((Error) -> Void)) {
        provider.request(.addUserName(username: username, wakeTime:wakeTime,
                                      sleepTime:sleepTime, durationInMonths: durationInMonths, goals:goals)) { result in
            self.resultTask(result, completion: completion, failure:failure)
        }
    }
    
    func updateGoals(username: String, goals:[String:Bool], completion: @escaping ((Data?) -> Void), failure: @escaping ((Error) -> Void)) {
        provider.request(.updateGoals(username: username, goals:goals)) { result in
            self.resultTask(result, completion: completion, failure:failure)
        }
    }
    
    func uploadImage(image:Data, completion: @escaping ((Data?) -> Void), failure: @escaping ((Error) -> Void)) {
        provider.request(.uploadImage(image: image)) { result in
            self.resultTask(result, completion: completion, failure:failure)
        }
    }
    func getGroupInfo(completion: @escaping ((Data?) -> Void), failure: @escaping ((Error) -> Void)) {
        provider.request(.getGroupInfo) { result in
            self.resultTask(result, completion: completion, failure:failure)
        }
    }
}

extension MiMORNiProvider {
    func resultTask(_ result: Result<Response, MoyaError>, completion: @escaping ((Data?) -> Void), failure: @escaping ((Error) -> Void)) {
        switch result {
        case let .success(response):
            let data = response.data
            let statusCode = response.statusCode
            if statusCode >= 300 {
                failure(MoyaError.statusCode(response))
            } else {
                completion(data)
            }
        case let .failure(error):
            failure(error)
        }
    }
}
