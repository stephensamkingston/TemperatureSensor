//
//  SocketIOManager.swift
//  SocketChat
//
//  Created by Gabriel Theodoropoulos on 1/31/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit
import SocketIO

class SocketIOManager: NSObject {
    static let sharedInstance = SocketIOManager()
    
    let socket = SocketIOClient(socketURL: URL(string: url)!, config: [.log(false), .forcePolling(true)])
    
    
    override init() {
        super.init()
    }
    
    
    func establishConnection() {
        socket.connect()
    }
    
    
    func closeConnection() {
        socket.disconnect()
    }
    
    
    func exitChatWithNickname(_ nickname: String, completionHandler: () -> Void) {
        socket.emit("exitUser", nickname)
        completionHandler()
    }
    
    
    func sendMessage(_ message: String, withNickname nickname: String) {
        socket.emit("chatMessage", nickname, message)
    }
    
   
    func receiveSocketItems(dataArray:[[String:Any]],sensorID:String?){
       
            for responseDict in dataArray{
                if let type = responseDict["type"] as? String{
                    switch type{
                    case "init":
                        
                        if let arrayOfMinuteReadings = responseDict["minute"] as? NSArray{
                            for readingDict in arrayOfMinuteReadings{
                                if let readingConvertedDict = readingDict as? [String:Any]{
                                    if let reading = TemperatureReading(dictionary: readingConvertedDict){
                                        reading.sensor = sensorID
                                        reading.scale = "minute"
                                        SensorManager.instance.temperatureObjectWithId(idString: reading.sensor!)?.recievedReading(reading: reading)
                                    }
                                }
                            }
                        }
                        
                        if let arrayOfRecentReadings = responseDict["recent"] as? NSArray{
                            for readingDict in arrayOfRecentReadings{
                                if let readingConvertedDict = readingDict as? [String:Any]{
                                    if let reading = TemperatureReading(dictionary: readingConvertedDict){
                                        reading.sensor = sensorID
                                        reading.scale = "recent"
                                        SensorManager.instance.temperatureObjectWithId(idString: reading.sensor!)?.recievedReading(reading: reading)
                                    }
                                }
                            }
                        }
                        break
                    case "update":
                        if let readingDict = responseDict as? [String : Any],
                            let reading = TemperatureReading(dictionary: readingDict){
                            SensorManager.instance.temperatureObjectWithId(idString: reading.sensor!)?.recievedReading(reading: reading)
                        }
                        break
                    case "delete":
                        break
                    default:
                        print("\(#function): Unidentified Type")
                    }
                }
            }
    }
   
    
    func sendStartTypingMessage(_ nickname: String) {
        socket.emit("startType", nickname)
    }
    
    
    func sendStopTypingMessage(_ nickname: String) {
        socket.emit("stopType", nickname)
    }
}
