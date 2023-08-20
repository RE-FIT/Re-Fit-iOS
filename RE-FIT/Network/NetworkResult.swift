//
//  NetworkResult.swift
//  RE-FIT
//
//  Created by jaegu park on 18/08/23.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
