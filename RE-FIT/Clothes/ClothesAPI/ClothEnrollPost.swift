//
//  ClothEnrollPost.swift
//  RE-FIT
//
//  Created by jaegu park on 12/08/23.
//

import Foundation
import Alamofire

struct ClothEnrollModel:Encodable {
    var category: Int
    var season: Int
    var targetCnt: Int
    var targetPeriod: Int
    var isPlan: Bool
    var cntPerMonth: Int
    var cntPerWeek: Int
}

class APIHandlerClothEnrollPost {
    static let instance = APIHandlerClothEnrollPost()
    
    func SendingPostClothEnroll(token: String, parameters: ClothEnrollModel, handler: @escaping (_ result: ClothEnrollresultModel)->(Void)) {
        let url = APIURL.clothURL
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
                    
                    let jsonresult = try JSONDecoder().decode(ClothEnrollresultModel.self, from: data!)
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

struct ClothEnrollresultModel: Codable {
    var code: String!
    var errorMessage: String!
}
