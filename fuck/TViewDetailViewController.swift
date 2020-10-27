//
//  TViewDetailViewController.swift
//  fuck
//
//  Created by vicky on 2020/10/2.
//  Copyright © 2020 Ariel. All rights reserved.
//

import UIKit

class TViewDetailViewController: UIViewController {
    var selectedButton: UIButton!
    @IBOutlet weak var menupage: UIButton!
    @IBOutlet weak var rankpage: UIButton!
    @IBOutlet weak var commendpage: UIButton!
    
    @IBAction func showmenu(_ sender: Any) {
        changeTab(to: menupage)
    }
    @IBAction func showrank(_ sender: Any) {
        changeTab(to: rankpage)
    }
    @IBAction func showcommend(_ sender: Any) {
        changeTab(to: commendpage)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedButton = menupage
    }
    func changeTab(to newButton: UIButton) {
        // 先利用 tintColor 取得 Button 預設的文字顏色
        let defaultColor = selectedButton.tintColor
        // 將目前選取的按鈕改成未選取的顏色
        if #available(iOS 13.0, *) {
            selectedButton.backgroundColor = UIColor.opaqueSeparator
        } else {
            // Fallback on earlier versions
        }
        selectedButton.setTitleColor(defaultColor, for: .normal)
        // 將參數傳來的新按鈕改成選取的顏色
        newButton.backgroundColor = UIColor.white
        if #available(iOS 13.0, *) {
            newButton.setTitleColor(UIColor.link, for: .normal)
        } else {
            // Fallback on earlier versions
        }
        // 將目前選取的按鈕改為新的按鈕
        selectedButton = newButton
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
