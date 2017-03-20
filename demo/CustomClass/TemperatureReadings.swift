//
//  TemperatureReadings.swift
//  Demo
//
//  Created by stephen sam kinston on 17/03/17.
//  Copyright © 2017 stephen sam kinston. All rights reserved.
//

import UIKit

enum ReadingScale{
    case recent,minute
    var jsonMappedValue:String{
        get{
            switch self{
            case .minute: return "minute"
            case .recent: return "recent"
            }
        }
    }
    
    init?(stringVal:String?) {
        switch stringVal {
        case .none: return nil
        case .some(let val):
            switch val{
            case ReadingScale.minute.jsonMappedValue:
                self = .minute
            case ReadingScale.recent.jsonMappedValue:
                self = .recent
            default: return nil
            }
        }
    }
}

enum ReadingType{
    case update, delete, initial
    
    var jsonMappedValue:String{
        get{
            switch self{
            case .update: return "update"
            case .delete: return "delete"
            case .initial: return "init"
            }
        }
    }

    init?(stringVal:String?) {
        switch stringVal {
        case .none: return nil
        case .some(let val):
            switch val{
            case ReadingType.update.jsonMappedValue:
                self = .update
            case ReadingType.delete.jsonMappedValue:
                self = .delete
            case ReadingType.initial.jsonMappedValue:
                self = .initial
            default: return nil
            }
        }
    }

}

class TemperatureReading{
    var keyTimeStamp:Int?
    var scale:ReadingScale?
    var sensor:String?
    var type:ReadingType?
    var value:Int?
    
    
    init?(dictionary:[String:Any],
          scale:ReadingScale? = nil,
          sensorID:String? = nil,
          readingType:ReadingType? = nil) {
        
        self.keyTimeStamp = dictionary["key"] as? Int
        if let scale = scale{
            self.scale = scale
        }else{
            self.scale = ReadingScale(stringVal: dictionary["scale"] as? String)
        }
        
        if let sensorID = sensorID{
            self.sensor = sensorID
        }else{
            self.sensor = dictionary["sensor"] as? String
        }
        
        if let readingType = readingType{
            self.type = readingType
        }else{
            self.type = ReadingType(stringVal: dictionary["type"] as? String)
        }
        self.value = dictionary["val"] as? Int
    }
}
