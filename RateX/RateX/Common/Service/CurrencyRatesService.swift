//
//  CurrencyRatesService.swift
//  RateX
//
//  Created by Andre Souza on 16/07/2018.
//  Copyright © 2018 Andre. All rights reserved.
//

import UIKit

class CurrencyRatesService: NSObject, ServiceProtocol {
    
    typealias Entity = CurrencyRates
    
    func get(base currency: Currency, _ completion: @escaping (RequestResultType<Entity>) -> Void) {
        let url = UrlUtil.path(for: .latest(currency))
        let service = APIService(with: url)
        service.getData(completion)
    }

}
