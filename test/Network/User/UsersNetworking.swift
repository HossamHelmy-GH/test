//
//  UsersNetworking.swift
//  test
//
//  Created by HossamHelmy on 24/02/2022.
//

import Alamofire
import Foundation

enum UsersNetworking {

    case login(String, String)
    
}

extension UsersNetworking: TargetType {

    var baseURL: String {
        switch self {
        default:
            return "https://homefix.za3bot.com/api/"
        }
    }
    var path: String {
        switch self {
        
        case .login:
            return "auth/login"
        }
    }
    var method: HTTPMethod {
        switch self {
        
        case .login:
            return .post
        }
    }
    var task: Task {
        switch self {
        case .login:
            return .requestParameters(parameters: self.paramter ?? [:], encoding: JSONEncoding.default)
        }
    }
      var paramter: [String: Any]? {
        switch self {
        case let .login(email, password):
            return ["email": email, "password": password]
        }
    }
    var headers: [String: String]? {
        switch self {
        default:
            return [:]
        }
    }
}
