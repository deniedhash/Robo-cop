//
//  ComplaintSelectViewController.swift
//  RoboCop
//
//  Created by Animesh
//  Copyright © 2019 Animesh. All rights reserved.
//

import UIKit

class ComplaintSelectViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    var tableView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup(){
        tableView = UITableView(frame: self.view.frame, style: .grouped)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        
        self.view.addSubview(tableView)
        tableView.register(CompaintsTableViewCell.self, forCellReuseIdentifier: "complaintsCell")
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.savedComplaint.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let block = appDelegate.savedComplaint[indexPath.row]
        var cell:CompaintsTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "complaintsCell", for: indexPath) as? CompaintsTableViewCell
        
        if (cell == nil){
            cell = CompaintsTableViewCell(style: .default, reuseIdentifier: "complaintsCell")
        }
        cell?.selectionStyle = .none
        cell?.updateData(dict: block)
        return cell!
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }


}
