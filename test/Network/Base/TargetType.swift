//
//  TargetType.swift
//  test
//
//  Created by HossamHelmy on 24/02/2022.
//


import Foundation
import Alamofire

enum Task {
    case requestPlain /// A request with no additional data.
    case requestParameters(parameters: [String: Any], encoding: ParameterEncoding) /// A requests body set with encoded parameters.
}

protocol TargetType {
    var baseURL: String { get }            /// The target's base `URL`.
    var path: String { get }               /// The path to be appended to `baseURL` to form the full `URL`
    var method: HTTPMethod { get }         /// The HTTP method used in the request.
    var task: Task { get }                 /// The type of HTTP task to be performed.
    var paramter: [String: Any]? { get }   /// Body Paramter
}

