//
//  CommunityGetModel.swift
//  RE-FIT
//
//  Created by jaegu park on 13/08/23.
//

import Foundation

struct CommunityModel {
    var code: Int
    var message: String
    var result: [CommunityResult]
}

struct CommunityResult: Codable {
    var postId: Int
    var title: String
    var imgUrl: String
    var gender: Int
    var deliveryType: Int
    var address: String
    var price: Int
    var size: Int
}

struct CommunitySearch {
    var keyword: String
}

struct CommunitySearchModel {
    var code: Int
    var message: String
    var result: [CommunitySearchResult]
}

struct CommunitySearchResult: Codable {
    var postId: Int
    var title: String
    var imgUrl: String
    var gender: Int
    var deliveryType: Int
    var sido: String
    var sigungu: String
    var bname: String
    var bname2: String
    var price: Int
}
