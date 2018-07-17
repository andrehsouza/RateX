//
//  CurrencySymbol.swift
//  RateX
//
//  Created by Andre Souza on 16/07/2018.
//  Copyright © 2018 Andre. All rights reserved.
//

import Foundation

enum Currency: String, Decodable, Hashable {
    
    //Before swift 4.2, otherwise: CaseIterable
    static let allCases = [USD, GBP, EUR, JPY, CHF, AUD, CAD, SGD, BRL, PLN].sorted(by:{ $0.name < $1.name})
    
    case USD
    case GBP
    case EUR
    case JPY
    case CHF
    case AUD
    case CAD
    case SGD
    case BRL
    case PLN
    
    var name: String {
        switch self {
        case .USD:
            return "US Dollar"
        case .EUR:
            return "Euro"
        case .AUD:
            return "Australian Dollar"
        case .BRL:
            return "Brazil Real"
        case .CAD:
            return "Canadian Dollar"
        case .CHF:
            return "Switzerland Franc"
        case .GBP:
            return "British Pound"
        case .JPY:
            return "Japanese Yen"
        case .PLN:
            return "Poland Zloty"
        case .SGD:
            return "Singapore Dollar"
        }
    }
    
    var symbol: String {
        switch self {
        case .USD:
            return "$"
        case .EUR:
            return "€"
        case .AUD:
            return "$"
        case .BRL:
            return "R$"
        case .CAD:
            return "$"
        case .CHF:
            return "CHF"
        case .GBP:
            return "£"
        case .JPY:
            return "¥"
        case .PLN:
            return "zł"
        case .SGD:
            return "$"
        }
    }
    
}


extension Currency: CurrencyListItemInterface {
    
    var title: String? {
        return "\(self.name) (\(self.symbol))"
    }
    
}
