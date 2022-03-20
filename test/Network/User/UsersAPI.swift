//
//  UsersAPI.swift
//  test
//
//  Created by HossamHelmy on 24/02/2022.
//

import Foundation
import Alamofire

protocol UsersAPIProtocol {
    func login (name:String ,password:String ,completion: @escaping (Result<LoginModel?> , Int) -> Void)
}

//============ * ========== -_- ========== * ============//

class UsersAPI: BaseAPI<UsersNetworking>, UsersAPIProtocol {
    func login (name:String ,password:String ,completion: @escaping (Result<LoginModel?> , Int) -> Void){
        self.fetchData(target: .login(name,password), responseClass: LoginModel.self, header: HeaderApi.header) { (result, status) in
                completion(result, status)
            }
        }
}
