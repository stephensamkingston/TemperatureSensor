//
//  DataRetriever.swift
//  ChurchTemplate
//
//  Created by stephen sam kingston on 2/22/17.
//  Copyright © 2017 stephen sam kingston. All rights reserved.
//

import Foundation
class DataRetriever:NSObject {
    enum RequestType {
        case Temperature
    }
    
    class func get(requestType:RequestType,completion:@escaping ([Temperature])->Void) {
        switch requestType {
        
        case .Temperature:
          ServerApi.sharedInstance.getData(urlString: url+"/sensornames"){
                (result:Data) in
            
                ParseSerialization.sharedInstance.pareseTemperature(result){
                    (TemperatureResults: [String]) in
                    
                    ServerApi.sharedInstance.getData(urlString: url+"/config"){
                        (result:Data) in
                        
                        ParseSerialization.sharedInstance.pareseConfig(result){
                            (TemperatureConfigResults: [String: AnyObject]) in
                            
                          var tempArray:[Temperature] = []
                            
                            for temperature in TemperatureResults{
                                if let minMax = TemperatureConfigResults[temperature] as? [String:AnyObject]{
                                    let tempObj = Temperature()
                                    tempObj.temperature = temperature
                                    tempObj.min = minMax["max"] as? String
                                    tempObj.min = minMax["min"] as? String
                                    tempArray.append(tempObj)
                                }
                              }
                              completion(tempArray)
                            }
                          }
                        }
                      }
                     }
                  }
                }
