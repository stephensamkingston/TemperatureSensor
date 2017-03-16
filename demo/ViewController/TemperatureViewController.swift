//
//  ViewController.swift
//  demo
//
//  Created by stephen sam kinston on 15/03/17.
//  Copyright © 2017 stephen sam kinston. All rights reserved.
//

import UIKit
import SocketIO

class TemperatureViewController: UIViewController,UIPopoverPresentationControllerDelegate {

internal var temperatureStack:[Temperature] = []
    
internal var popOver:MoreOptionsTableViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retrievePodcast()
        
    }

    
    func retrievePodcast(){
 
        DataRetriever.get(requestType: .Temperature) { (temperature: [Temperature]) in
          DispatchQueue.main.async {
              print(temperature)
            self.temperatureStack = temperature
            }
          }
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    @IBAction func btnTapped(_ sender: Any) {
        popOver = MoreOptionsTableViewController()
        popOver?.delTempStatus = self as? TempStatus
        popOver?.modalPresentationStyle = UIModalPresentationStyle.popover
        popOver?.optionsArray = self.temperatureStack
        // set up the popover presentation controller
        popOver?.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.any
        if let pop = popOver?.popoverPresentationController {
             pop.delegate = self
        }
       
        popOver?.popoverPresentationController?.sourceView = sender as? UIView // button
        
        popOver?.popoverPresentationController?.sourceRect = (sender as AnyObject).bounds
        self.present(popOver!, animated: true, completion:nil)
    }
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }

}




extension TemperatureViewController{
    func selectedOptions(temperature:Temperature){
     print("I am here ,Not an issue")
    }
}

