//
//  TViewController.swift
//  fuck
//
//  Created by Rick on 2020/9/22.
//  Copyright © 2020 Ariel. All rights reserved.
//

import UIKit

class CViewController: UIViewController,UITableViewDataSource,UITableViewDelegate, HomeModelProtocol{
    
    var feedItems: NSArray = NSArray()
    var selectedLocation : LocationModel = LocationModel()
    
    func itemsDownloaded(items: NSArray) {
        feedItems = items
        self.listTableView.reloadData()
    }
    
    
 
    @IBOutlet var listTableView: UITableView!
    //how many cells(dataSource)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedItems.count
    }
    //Delegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier: String = "datacell"
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        // Get the location to be shown
        let item: LocationModel = feedItems[indexPath.row] as! LocationModel
        // Get references to labels of cell
        cell.textLabel!.text = item.name
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let pagecommend = storyboard.instantiateViewController(withIdentifier: "pagecommend")  as! CommendTableViewController

        pagecommend.receive = indexPath.row
        present(pagecommend, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        
        let homeModel = HomeModel()
        homeModel.delegate = self
        homeModel.downloadItems()
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
