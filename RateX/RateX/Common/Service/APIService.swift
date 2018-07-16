//
//  APIService.swift
//  RateX
//
//  Created by Andre Souza on 11/07/2018.
//  Copyright © 2018 AndreSamples. All rights reserved.
//

import Foundation
import Alamofire

protocol ServiceProtocol {
    associatedtype Entity where Entity: Decodable
}

final class APIService: NSObject {
    
    private var url: String?
    
    init(with url: String) {
        super.init()
        self.url = url
    }
    
}

extension APIService {
    
    func getData<T: Decodable>(_ completion: @escaping (RequestResultType<T>) -> Void) {
        
        guard let url = self.url else {
            completion(.failure(ErrorResponse("Invalid URL.")))
            return
        }
        
        printRequest(url: url, method: "GET")
        
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default).validate(statusCode: 200..<300).responseJSON { response in
            self.printResponse(response: response)
            switch response.result {
            case .success:
                
                guard let data = response.data else {
                    completion(.failure(ErrorResponse("Empty data.")))
                    return
                }
                
                do {
                    let model = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(model))
                } catch {
                    completion(.failure(ErrorResponse("Decode error: \(error.localizedDescription)")))
                }
                
            case .failure:
                let statusCode = response.response?.statusCode ?? -1
                let resultType: ResponseType = ResponseType(rawValue: statusCode) ?? .UNDEFINED
                completion(.failure(ErrorResponse(resultType)))
            }
        }
    }
    
}

extension APIService {
    
    func printRequest(url: String, method: String){
        debugPrint("----------------------- REQUEST ------------------------------")
        debugPrint("")
        debugPrint("\(method): \(url)")
        debugPrint("")
        debugPrint("---------------------------------------------------------------")
    }
    
    func printResponse(response:DataResponse<Any>){
        debugPrint("----------------------- RESPONSE ------------------------------")
        debugPrint("")
        debugPrint("Request for \(response.response?.url?.absoluteString ?? "-sem url-") completed with status code \(response.response?.statusCode ?? 0)")
        debugPrint("data:")
        if let json = response.result.value as? [String : Any] {
            print(json)
        }
        debugPrint("")
        debugPrint("---------------------------------------------------------------")
    }
    
}
