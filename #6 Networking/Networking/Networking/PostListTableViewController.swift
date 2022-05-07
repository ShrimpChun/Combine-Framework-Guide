//
//  PostListTableViewController.swift
//  Networking
//
//  Created by Shrimp Hsieh on 2022/5/7.
//

import UIKit
import Combine

class PostListTableViewController: UITableViewController {

    private var webservice = Webservice()
    private var cancellable: AnyCancellable?
    
    private var posts = [Post]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cancellable = self.webservice.getPosts()
            .catch { _ in Just(self.posts) }
            .assign(to: \.posts, on: self)
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath)
        
        let post = self.posts[indexPath.row]
        cell.textLabel?.text = post.title
        return cell
    }

}
