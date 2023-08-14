//
//  UserInfoModel.swift
//  RE-FIT
//
//  Created by jaegu park on 12/08/23.
//

import Foundation

struct UserInfoModel: Codable {
    var imageUrl: String
    var email: String
    var loginId: String
    var name: String
    var birth: String
    var gender: Int
}

struct FeedScrapModel: Codable {
    var code: Int
    var message: String
    var result: [FeedScrapResult]
}

struct FeedScrapResult: Codable {
    var postId: Int
    var title: String
    var imgUrl: String
    var gender: Int
    var deliveryType: Int
    var address: String
    var price: Int
    var size: Int
}
