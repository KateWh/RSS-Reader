//
//  FeedCell.swift
//  RSS-Reader
//
//  Created by vit on 1/17/19.
//  Copyright © 2019 ket. All rights reserved.
//

import UIKit
import FeedKit

class FeedCell: UITableViewCell {
    
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // assembled the cell
    func updateCell(withFeedItem feedItem: RSSFeedItem) {
        var imageLink = ""
        var category = ""

        for media in (feedItem.media?.mediaThumbnails)! {
            imageLink = media.attributes?.url ?? "No image"
        }
        for categories in feedItem.categories! {
            category = categories.value ?? "None"
        }

        self.myImageView.sd_setImage(with: URL(string: imageLink), completed: nil)
        self.labelTitle.text = feedItem.title
        self.labelSubtitle.text = feedItem.description
        self.category.text = category
    }
    
}
