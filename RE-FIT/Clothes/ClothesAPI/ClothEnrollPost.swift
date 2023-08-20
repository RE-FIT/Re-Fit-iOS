//
//  ClothEnrollPost.swift
//  RE-FIT
//
//  Created by jaegu park on 12/08/23.
//

import Foundation
import Alamofire

struct ClothEnrollPostService {
    
    static let shared = ClothEnrollPostService()
    
    func editActivity (token: String,
                       imageData: UIImage?,
                       category: Int,
                       season: Int,
                       targetCnt: Int,
                       targetPeriod: Int,
                       isPlan: Bool,
                       cntPerMonth: Int,
                       cntPerWeek: Int,
                       completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let URL = APIURL.clothURL
        let header : HTTPHeaders = [
            "Content-Type" : "multipart/form-data",
            "token" : "\(token)" ]
        
        let parameters: [String : Any] = [
            "category": category,
            "season": season,
            "targetCnt": targetCnt,
            "targetPeriod": targetPeriod,
            "isPlan": isPlan,
            "cntPerMonth": cntPerMonth,
            "cntPerWeek": cntPerWeek
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
