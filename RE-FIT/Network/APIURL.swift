//
//  APIURL.swift
//  RE-FIT
//
//  Created by jaegu park on 2023/06/30.
//

import Foundation

struct APIURL {
    // MARK: - Base URL
    static let baseURL = "http://www.umc-refit.com"
    
    // MARK: - newShop URL
    static let newLoginURL = baseURL + "/auth"
    
    // MARK: - Review URL
    static let clothURL = baseURL + "/refit/clothe"
    
    static let communityURL = baseURL + "/refit/community"
    
    static let chatURL = baseURL + "/chat/room"
    
    static let mypageURL = baseURL + "/refit/mypage"
}
