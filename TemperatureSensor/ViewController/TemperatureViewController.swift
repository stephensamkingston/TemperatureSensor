//
//  ViewController.swift
//  demo
//
//  Created by stephen sam kinston on 15/03/17.
//  Copyright © 2017 stephen sam kinston. All rights reserved.
//

import UIKit
import SocketIO

class TemperatureViewController
: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        retrievePodcast()
    }

    
    func retrievePodcast(){
 
        DataRetriever.get(requestType: .Temperature) { (tracks: [Temperature]) in
          DispatchQueue.main.async {
              print(tracks)
            }
          }
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

