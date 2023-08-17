//
//  SingoPost.swift
//  RE-FIT
//
//  Created by jaegu park on 17/08/23.
//

import Foundation
import Alamofire

struct SingoModel: Encodable {
    var reportedMemeber: Singoname
    var reason: String
}

struct Singoname: Encodable {
    var name: String
}

class APIHandlerSingoPost {
    static let instance = APIHandlerSingoPost()
    
    func SendingPostSingo(token: String, parameters: SingoModel, handler: @escaping (_ result: SingoresultModel)->(Void)) {
        let url = APIURL.baseURL + "/refit/report"
        let headers:HTTPHeaders = [
            "content-type": "application/json;charset=utf-8",
            "X-ACCESS-TOKEN": "\(token)"
        ]
        
        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default, headers: headers).response { responce in
            switch responce.result {
            case .success(let data):
                print(String(decoding: data!, as: UTF8.self))
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed)
                    print(json)
                    
                    let jsonresult = try JSONDecoder().decode(SingoresultModel.self, from: data!)
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

struct SingoresultModel: Codable {
    var code: String!
    var errorMessage: String!
}
