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
    var newsLink = URL(string: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        core.getData { (error) in
                if error != nil {
                    let alertError = UIAlertController(title: "\(String(describing: error))", message: "", preferredStyle: .alert)
                alertError.addAction(UIAlertAction(title: "Try again!", style: .default, handler: nil))
                alertError.addAction(UIAlertAction(title: "Cancel", style: .cancel , handler: nil))
                    self.present(alertError, animated: true)
            } else {
                self.tableView.reloadData()
            }
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        newsLink = URL(string: core.feed[indexPath.row].link!)
        self.performSegue(withIdentifier: "goToNews", sender: self)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return core.feed.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        var imageLink = ""
        var category = ""

        for media in (core.feed[indexPath.row].media?.mediaThumbnails)! {
            imageLink = media.attributes?.url ?? "No image"
        }
        for i in core.feed[indexPath.row].categories! {
            category = i.value ?? "None"
        }

        cell.myImageView.sd_setImage(with: URL(string: imageLink), completed: nil)
        cell.labelTitle.text = core.feed[indexPath.row].title
        cell.labelSubtitle.text = core.feed[indexPath.row].description
        cell.category.text = category
        print("\(String(describing: core.feed[indexPath.row].link))")
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let WebVC = segue.destination as? WebVC
        WebVC?.newsLink = newsLink
    }
    
}

