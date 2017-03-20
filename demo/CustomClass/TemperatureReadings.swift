//
//  TemperatureReadings.swift
//  Demo
//
//  Created by stephen sam kinston on 17/03/17.
//  Copyright © 2017 stephen sam kinston. All rights reserved.
//

import UIKit

class TemperatureReading{
    var keyTimeStamp:String?
    var scale:String?
    var sensor:String?
    var type:String?
    var value:String?
    
    
    init?(dictionary:[String:String]) {
//
//        guard let sensorId = dictionary["sensor"] else {
//            return nil
//        }
        self.keyTimeStamp = dictionary["key"]
        self.scale = dictionary["scale"]
        self.sensor = dictionary["sensor"]
        self.type = dictionary["type"]
        self.value = dictionary["value"]
    }
}
