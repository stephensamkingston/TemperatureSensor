//
//  MoreOptionsViewControllerTableViewController.swift
//  ChurchTemplate
//
//  Created by stephen sam kingston on 3/2/17.
//  Copyright © 2017 stephen sam kingston. All rights reserved.
//

import UIKit

protocol TempStatus{
func selectedOptions(temperature:Temperature)
}

class MoreOptionsTableViewController: UITableViewController {

    var delTempStatus:TempStatus?
    var optionsArray:[Temperature]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.preferredContentSize = CGSize(width: 270, height: 427)
        tableView.register(UITableViewCell.classForKeyedArchiver(),
                           forCellReuseIdentifier: "reuseIdentifier")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return optionsArray!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
       cell.backgroundColor =  UIColor.black
       cell.textLabel?.text = optionsArray?[indexPath.row].temperature
       cell.textLabel?.textColor = UIColor.white
       return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        delTempStatus?.selectedOptions(temperature: (optionsArray?[indexPath.row])!)
    }

}
