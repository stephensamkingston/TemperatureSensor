//
//  GraphViewController.swift
//  Demo
//
//  Created by Robert on 20/03/17.
//  Copyright © 2017 stephen sam kinston. All rights reserved.
//

import UIKit
import CorePlot

class GraphViewController: UIViewController {
    @IBOutlet weak var graphHostingView: CPTGraphHostingView!
    var sensor:Temperature?{
        didSet{
            self.startGettingValues()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK:- Polling the device
    func startGettingValues(){
        if let sensor = sensor{
            SocketIOManager.sharedInstance.socket.emit("subscribe", sensor.sensorId);
            SocketIOManager.sharedInstance.socket.on("data") { (dataArray, socketAck) -> Void in
                SocketIOManager.sharedInstance.receiveSocketItems(dataArray: dataArray as! [[String : Any]],
                                                                  sensorID: sensor.sensorId)
                print("Updated array:",dataArray)
            }
        }
    }
}
