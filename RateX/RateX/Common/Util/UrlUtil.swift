//
//  RateX.swift
//  TheVargo
//
//  Created by Andre on 11/07/2018.
//  Copyright © 2018 AndreSamples. All rights reserved.
//

import Foundation

let SERVER_URL = "https://exchangeratesapi.io/api"

enum EndPoints {

    case latest(Currency)

    var complement: String {
        switch self {
        case .latest(let currency):
            let allCurrencies = Currency.allCases.filter({ $0 != currency }).compactMap({ $0.rawValue }).joined(separator: ",")
            return "/latest?base=\(currency.rawValue)&symbols=\(allCurrencies)"
        }
    }

}

final class UrlUtil {

    static func path(for endPoint: EndPoints) -> String {
        return "\(SERVER_URL)\(endPoint.complement)"
    }

}
