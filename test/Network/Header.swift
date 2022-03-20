//
//  Header.swift
//  test
//
//  Created by HossamHelmy on 24/02/2022.
//

import Foundation
import Alamofire
var loginModel: LoginModel?

struct HeaderApi {
    static var header: [String: Any] {
        return ["AccessToken":"\(MyDataClassLogin.CodingKeys.apiToken)"]
    }
    
    
    
    
    
    
    
}

