//
//  CommunityPost.swift
//  RE-FIT
//
//  Created by jaegu park on 12/08/23.
//

import Foundation
import Alamofire

struct CommunityEnrollModel:Encodable {
    var title: String
    var gender: Int
    var postType: Int
    var price: Int!
    var category: Int
    var size: Int
    var deliveryType: Int
    var deliveryFee: Int!
    var detail: String
    var address: String!
}

class APIHandlerCommunityEnrollPost {
    static let instance = APIHandlerCommunityEnrollPost()
    
    func SendingPostCommunityEnroll(token: String, parameters: CommunityEnrollModel, handler: @escaping (_ result: CommunityEnrollresultModel)->(Void)) {
        let url = APIURL.communityURL
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
                    
                    let jsonresult = try JSONDecoder().decode(CommunityEnrollresultModel.self, from: data!)
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

struct CommunityEnrollresultModel: Codable {
    var code: String!
    var message: String!
    var postId: Int
    var title: String
    var author: String
    var imgUrls: [String]
    var size: Int
    var deliveryType: Int
    var deliveryFee: Int
    var address: String
    var price: Int
    var detail: String
    var postType: Int
    var postState: Int
}
