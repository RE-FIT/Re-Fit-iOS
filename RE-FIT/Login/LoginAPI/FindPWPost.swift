//
//  FindPWPost.swift
//  RE-FIT
//
//  Created by jaegu park on 12/08/23.
//

import Foundation
import Alamofire

struct FindPWModel:Encodable {
    var name: String
    var loginID: String
    var email: String
}

class APIHandlerFindPWPost {
    static let instance = APIHandlerFindPWPost()
    
    func SendingPostFindPW(parameters: FindPWModel, handler: @escaping (_ result: FindPWresultModel)->(Void)) {
        let url = APIURL.newLoginURL + "/reset/password"
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
                    
                    let jsonresult = try JSONDecoder().decode(FindPWresultModel.self, from: data!)
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

struct FindPWresultModel: Codable {
    var code: String!
    var errorMessage: String!
}
