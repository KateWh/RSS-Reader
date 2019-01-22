//
//  RSS_ReaderTests.swift
//  RSS-ReaderTests
//
//  Created by vit on 1/22/19.
//  Copyright © 2019 ket. All rights reserved.
//

import XCTest
@testable import RSS_Reader
@testable import FeedKit

class RSS_ReaderTests: XCTestCase {

    let core = CoreRSS()
    
    func testArrayOfItems() {
        let expectation = XCTestExpectation(description: "Parsing RSS test")
        core.getData { (error) in
            XCTAssertTrue(self.core.feed.count > 0)
            // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
}
