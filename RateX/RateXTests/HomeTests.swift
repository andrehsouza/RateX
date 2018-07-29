//
//  HomeTests.swift
//  RateXTests
//
//  Created by Andre on 29/07/2018.
//  Copyright © 2018 Andre. All rights reserved.
//

import XCTest
@testable import RateX

class HomeTests: XCTestCase {
    
    let homeViewController = HomeViewController()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_numberOfItemsShouldBeGreaterThanZero() {
        let count = homeViewController.presenter.numberOfItems(in: 0)
        XCTAssertGreaterThan(count, 0)
    }
    
    func test_requestCurrencyRatesSuccess() {
        let row = Currency.allCases.index(of: .USD)
        XCTAssertNotNil(row)
    }
    
}
