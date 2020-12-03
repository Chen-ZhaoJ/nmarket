//
//  TViewDetailViewController.swift
//  fuck
//
//  Created by vicky on 2020/10/2.
//  Copyright © 2020 Ariel. All rights reserved.
//

import UIKit

class TViewDetailViewController: UIViewController {
    @IBOutlet var containerViews: [UIView]!
    @IBOutlet weak var change: UISegmentedControl!
    @IBAction func changePage(_ sender: UISegmentedControl) {
        for containerView in containerViews {
           containerView.isHidden = true
        }
        containerViews[sender.selectedSegmentIndex].isHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        containerViews[0].isHidden = false
        containerViews[1].isHidden = true
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
