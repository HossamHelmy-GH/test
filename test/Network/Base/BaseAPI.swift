//
//  BaseAPI.swift
//  test
//
//  Created by HossamHelmy on 24/02/2022.
//

import Foundation
import Alamofire

class BaseAPI<T: TargetType> {
    
    func fetchData<M: Decodable>(target: T, responseClass: M.Type,header:[String:Any], completion:@escaping (Result<M?> , Int) -> Void) {
        
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let params = buildParams(task: target.task)
        print("Headers ===>>> \(header)")
        print("Parametrs =====> \(params.0)")
        
        Alamofire.request(target.baseURL + target.path, method: method!, parameters: params.0, encoding: params.1, headers: header as? HTTPHeaders).responseJSON { (response) in
            let status = response.response?.statusCode
            do {
                let responseObj = try? JSONDecoder().decode(M.self, from: response.data!)
                completion(.success(responseObj) , status ?? 0)
                print("Status code ========= >>>>>> \(status ?? 0)")
            } catch {print("Error Error Error \(error)")}
        }
    }
    private func buildParams(task: Task) -> ([String:Any], ParameterEncoding) {
        switch task {
        case .requestPlain:
            return ([:], URLEncoding.default)
        case let .requestParameters(parameters:  parameters, encoding:  encoding):
            return (parameters, encoding)
        }
    }
    
}
