//
//  UserJoinPost.swift
//  RE-FIT
//
//  Created by jaegu park on 12/08/23.
//

import Foundation
import Alamofire

struct UserJoinModel:Encodable {
    var loginId: String
    var password: String
    var email: String
    var name: String
    var birth: String
    var gender: Int
}

class APIHandlerUserJoinPost {
    static let instance = APIHandlerUserJoinPost()
    
    func SendingPostUserJoin(parameters: UserJoinModel, handler: @escaping (_ result: UserJoinresultModel)->(Void)) {
        let url = APIURL.newLoginURL + "/join"
        let headers:HTTPHeaders = [
            "content-type": "application/json;charset=utf-8"
        ]
        
        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default, headers: headers).response { responce in
            switch responce.result {
            case .success(let data):
                print(String(decoding: data!, as: UTF8.self))
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed)
                    print(json)
                    
                    let jsonresult = try JSONDecoder().decode(UserJoinresultModel.self, from: data!)
                    handler(jsonresult)
                    print(jsonresult)
                } catch let DecodingError.dataCorrupted(context) {
                    print(context)
                } catch let DecodingError.keyNotFound(key, context) {
                    print("Key '\(key)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.valueNotFound(value, context) {
                    print("Value '\(value)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.typeMismatch(type, context)  {
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch {
                    print(String(describing:error))
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

struct UserJoinresultModel: Codable {
    var code: String!
    var errorMessage: String!
}
