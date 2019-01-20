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
    // refresh tableView
    lazy var refresher: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(updateData), for: .valueChanged)
        return refreshControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.refreshControl = refresher
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        updateData()
    }
    
    // selector of refresher
    @objc func updateData() {
        core.getData { (error) in
            if error != nil {
                let alertError = UIAlertController(title: "Failed to load feed", message: "", preferredStyle: .alert)
                alertError.addAction(UIAlertAction(title: "Try again!", style: .default, handler: { action in self.updateData() }))
                alertError.addAction(UIAlertAction(title: "Cancel", style: .cancel , handler: { action in self.refreshControl?.endRefreshing() }))
                self.present(alertError, animated: true)
            } else {
                self.tableView.reloadData()
                // stop refresh wheel
                self.refreshControl?.endRefreshing()
            }
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newsLink = URL(string: core.feed[indexPath.row].link!)
        self.performSegue(withIdentifier: "goToNews", sender: newsLink)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return core.feed.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 430
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        cell.updateCell(withFeedItem: core.feed[indexPath.row])
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let WebVC = segue.destination as? WebVC
        WebVC?.newsLink = sender as? URL
    }
    
}

