//
//  TemperatureReadings.swift
//  Demo
//
//  Created by stephen sam kinston on 17/03/17.
//  Copyright © 2017 stephen sam kinston. All rights reserved.
//

import UIKit

class TemperatureReading{
    var keyTimeStamp:Int?
    var scale:String?
    var sensor:String?
    var type:String?
    var value:Int?
    
    
    init?(dictionary:[String:Any]) {
//
//        guard let sensorId = dictionary["sensor"] else {
//            return nil
//        }
        self.keyTimeStamp = dictionary["key"] as? Int
        self.scale = dictionary["scale"] as? String
        self.sensor = dictionary["sensor"] as? String
        self.type = dictionary["type"] as? String
        self.value = dictionary["val"] as? Int
    }
}
