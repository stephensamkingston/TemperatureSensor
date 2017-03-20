//
//  Temperature.swift
//  Demo
//
//  Created by stephen sam kinston on 15/03/17.
//  Copyright © 2017 stephen sam kinston. All rights reserved.
//

import UIKit

class Temperature: NSObject {
    var sensorId:String = ""
    var max:String?
    var min:String?
    
    var historyOfMinuteReadings:[TemperatureReading] = []
    var historyOfSecondReadings:[TemperatureReading] = []

    
    func recievedReading(reading:TemperatureReading){
        guard let scale = reading.scale else{
            return
        }
        if scale == .recent{
            self.historyOfSecondReadings.append(reading)
        }else if scale == .minute{
            self.historyOfMinuteReadings.append(reading)
        }else{
            print("\(#function): ERROR: Unidentified Scale")
        }
    }
}
