//
//  ViewController.swift
//  Side Menu 1
//
//  Created by Adwait Barkale on 21/07/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var sideView: UIView!
    @IBOutlet weak var tblSideBar: UITableView!
    var isSideViewOpen:Bool = false
    
    
    var arrData = ["Profile","Contact","Camera","Location"]
    var arrImg = [UIImage(named: "profile"),UIImage(named: "contact"),UIImage(named: "camera"),UIImage(named: "location")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideView.isHidden = true
        isSideViewOpen = false
    }
    
    @IBAction func btnMenuTapped(_ sender: UIButton) {
        
        sideView.isHidden = false
        self.view.bringSubviewToFront(sideView)
        if !isSideViewOpen{
            isSideViewOpen = true
            sideView.frame = CGRect(x: 0, y: 88, width: 0, height: 605)
            tblSideBar.frame = CGRect(x: 0, y: 0, width: 0, height: 597)
            UIView.setAnimationDuration(0.3)
            UIView.setAnimationDelegate(self)
            UIView.beginAnimations("TableAnimation", context: nil)
            sideView.frame = CGRect(x: 8, y: 88, width: 311, height: 605)
            tblSideBar.frame = CGRect(x: 0, y: 8, width: 311, height: 597)
            UIView.commitAnimations()
        }else{
            // sideView.isHidden = true
            isSideViewOpen = false
           sideView.frame = CGRect(x: 8, y: 88, width: 311, height: 605)
            tblSideBar.frame = CGRect(x: 0, y: 8, width: 311, height: 597)
            UIView.setAnimationDuration(0.3)
            UIView.setAnimationDelegate(self)
            UIView.beginAnimations("TableAnimation", context: nil)
            sideView.frame = CGRect(x: 8, y: 88, width: 0, height: 605)
            tblSideBar.frame = CGRect(x: 0, y: 0, width: 0, height: 597)
            UIView.commitAnimations()
        }
        
    }
    

}

extension ViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "tblCell") as! TableViewCell
        cell.imgView.image = arrImg[indexPath.row]
        cell.lblName.text = arrData[indexPath.row]
        return cell
    }
    
    
    
    
}

