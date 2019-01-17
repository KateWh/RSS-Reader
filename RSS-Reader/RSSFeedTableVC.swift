//
//  ViewController.swift
//  RSS-Reader
//
//  Created by ket on 16.01.2019.
//  Copyright © 2019 ket. All rights reserved.
//

import UIKit
import SDWebImage

class RSSFeedTableVC: UITableViewController {

    let core = CoreRSS()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        core.getData { (error) in
            if error != nil {
                print("ERROR!")
            } else {
                self.tableView.reloadData()
            }
        }
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return core.feed.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        cell.myImageView!.sd_setImage(with: URL(string: "https://media.wired.com/photos/5c40b012ae95ea2c3a2901b8/master/pass/Culture_Monitor_Ghostbusters%20(1).jpg"), completed: nil)
        cell.labelTitle.text = core.feed[indexPath.row].title
        cell.labelSubtitle.text = core.feed[indexPath.row].description
        return cell
    }

}

