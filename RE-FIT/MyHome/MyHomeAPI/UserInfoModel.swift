//
//  UserInfoModel.swift
//  RE-FIT
//
//  Created by jaegu park on 12/08/23.
//

import Foundation

struct UserInfoModel : Codable {
    var imageUrl: String
    var email: String
    var loginId: String
    var name: String
    var birth: String
    var gender: Int
}
