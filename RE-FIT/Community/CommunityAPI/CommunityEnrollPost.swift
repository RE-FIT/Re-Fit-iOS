//
//  CommunityPost.swift
//  RE-FIT
//
//  Created by jaegu park on 12/08/23.
//

import Foundation
import Alamofire

struct CommunityEnrollPostService {
    
    static let shared = CommunityEnrollPostService()
    
    func editActivity (token: String,
                       imageData: UIImage?,
                       title: String,
                       gender: Int,
                       postType: Int,
                       price: Int!,
                       category: Int,
                       size: Int,
                       deliveryType: Int,
                       deliveryFee: Int!,
                       detail: String,
                       address: String!,
                       completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let URL = APIURL.clothURL
        let header : HTTPHeaders = [
            "Content-Type" : "multipart/form-data",
            "token" : "\(token)" ]
        
        let parameters: [String : Any] = [
            "title": title,
            "gender": gender,
            "postType": postType,
            "price": price ?? 0,
            "category": category,
            "size": size,
            "deliveryType": deliveryType,
            "deliveryFee": deliveryFee ?? 0,
            "detail": detail,
            "address": address ?? ""
        ]
        AF.upload(multipartFormData: { multipartFormData in
            for (key, value) in parameters {
                multipartFormData.append("\(value)".data(using: .utf8)!, withName: key)
            }
            if let image = imageData?.pngData() {
                multipartFormData.append(image, withName: "activityImage", fileName: "\(image).png", mimeType: "image/png")
            }
        }, to: URL, usingThreshold: UInt64.init(), method: .post, headers: header).response { response in
            guard let statusCode = response.response?.statusCode,
                  statusCode == 200
            else { return }
            completion(.success(statusCode))
        }
    }
}
