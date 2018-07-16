//
//  ResponseType.swift
//  RateX
//
//  Created by Andre Souza on 11/07/2018.
//  Copyright © 2018 AndreSamples. All rights reserved.
//

import Foundation

enum ResponseType: Int {
    
    case UNDEFINED                  = -1
    case HTTP_CONNECTION            = 0
    case HTTP_ALAMOFIRE_CONNECTION  = -1009
    case HTTP_BAD_REQUEST           = 400
    case HTTP_UNAUTORIZED           = 401
    
}

extension ResponseType {
    
    var title: String {
        switch self {
        case .HTTP_UNAUTORIZED:
            return "Access denied"
        case .HTTP_CONNECTION: fallthrough
        case .HTTP_ALAMOFIRE_CONNECTION: fallthrough
        case .HTTP_BAD_REQUEST: fallthrough
        case .UNDEFINED: fallthrough
        default:
            return "Attention"
        }
    }
    
    var message: String {
        
        switch self {
        case .HTTP_CONNECTION: fallthrough
        case .HTTP_ALAMOFIRE_CONNECTION:
            return "Please, check your internet connection."
        case .HTTP_UNAUTORIZED:
            return "You're not authorized to access."
        case .HTTP_BAD_REQUEST: fallthrough
        case .UNDEFINED: fallthrough
        default:
            return "An unexpected error has occurred, please try again in a moment."
        }
    }
    
}
