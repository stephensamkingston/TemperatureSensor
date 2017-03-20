//
//  SensorManager.swift
//  Demo
//
//  Created by stephen sam kinston on 17/03/17.
//  Copyright © 2017 stephen sam kinston. All rights reserved.
//

import Foundation

class SensorManager{
    static let instance = SensorManager()
    private init(){
    }
    
    var arrayOfSensors:[Temperature] = []
    
    
    func temperatureObjectWithId(idString:String) -> Temperature?{
        for sensor in arrayOfSensors {
            if sensor.sensorId == idString{
                return sensor
            }
        }
        return nil
    }
    
    
    
}
