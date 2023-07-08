//
//  APIURL.swift
//  RE-FIT
//
//  Created by jaegu park on 2023/06/30.
//

import Foundation

struct APIURL {
    // MARK: - Base URL
    static let baseURL = "http://www.rebornapp.shop"
    
    // MARK: - newShop URL
    static let newStoreURL = baseURL + "/store/new"
    
    // MARK: - Review URL
    static let reviewURL = baseURL + "/review/best"
    
    static let inprogressURL = baseURL + "/reborns/inprogress/user/"
    
    static let willLikeshopURL = baseURL + "/store/likeable-stores"
}
