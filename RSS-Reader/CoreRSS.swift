//
//  CoreRSS.swift
//  RSS-Reader
//
//  Created by ket on 16.01.2019.
//  Copyright © 2019 ket. All rights reserved.
//

import Foundation
import FeedKit

class CoreRSS {

    var feed: [RSSFeedItem] = []
    
    func getData(_ completionHandler: @escaping (Error?) -> Void) {
        let feedURL = URL(string: "https://www.wired.com/feed/rss")!
        let parser = FeedParser(URL: feedURL) // or FeedParser(data: data) or FeedParser(xmlStream: stream)
        // Parse asynchronously, not to block the UI.
        parser.parseAsync(queue: DispatchQueue.global(qos: .userInitiated)) { (result) in
            // Do your thing, then back to the Main thread
            DispatchQueue.main.async {
                if let feed = result.rssFeed?.items {
                    self.feed = feed
                }
                completionHandler(result.error)
            }
        }
    }
    
}


