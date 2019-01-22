//
//  RSS_ReaderTests.swift
//  RSS-ReaderTests
//
//  Created by vit on 1/22/19.
//  Copyright © 2019 ket. All rights reserved.
//

import XCTest
@testable import RSS_Reader
@testable import Pods_RSS_Reader
@testable import FeedKit

class RSS_ReaderTests: XCTestCase {

    let core = CoreRSS()
    
    func testArrayOfItems() {
        
        let expectation = XCTestExpectation(description: "Parsing RSS test")
        
        let feedURL = URL(string: "https://www.wired.com/feed/rss")!
        let parser = FeedParser(URL: feedURL) // or FeedParser(data: data) or FeedParser(xmlStream: stream)
        // Parse asynchronously, not to block the UI.
        parser.parseAsync(queue: DispatchQueue.global(qos: .userInitiated)) { (result) in
            // Do your thing, then back to the Main thread
            let feed = result.rssFeed?.items
            let error = result.error
            XCTAssertNil(error)
            XCTAssertNotNil(feed)
            
            // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
            expectation.fulfill()
            
        }
        wait(for: [expectation], timeout: 10.0)
    }

}
