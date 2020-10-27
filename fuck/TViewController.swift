//
//  TViewController.swift
//  fuck
//
//  Created by Rick on 2020/9/22.
//  Copyright © 2020 Ariel. All rights reserved.
//

import UIKit

class TViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var restaurantNames = ["jj","pp"]

    @IBOutlet weak var listTableView: UITableView!
    //how many cells(dataSource)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }
    //Delegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = restaurantNames[indexPath.row]
        cell.accessoryType = .disclosureIndicator //小圖標
        return cell
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
