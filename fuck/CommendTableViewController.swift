//
//  CommendTableViewController.swift
//  fuck
//
//  Created by vicky on 2020/12/3.
//  Copyright © 2020 Ariel. All rights reserved.

import UIKit

class CommendTableViewController: UITableViewController {
    var commend = ["good","bad"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return commend.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        cell.textLabel?.text = commend[indexPath.row]
        return cell
    }

}
