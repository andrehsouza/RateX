//
//  RequestResultType.swift
//  RateX
//
//  Created by Andre Souza on 11/07/2018.
//  Copyright © 2018 AndreSamples. All rights reserved.
//

import Foundation

enum RequestResultType<T> {
    case success(T)
    case failure(ErrorResponse)
}
