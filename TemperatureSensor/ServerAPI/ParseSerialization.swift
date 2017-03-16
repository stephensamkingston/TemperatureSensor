//
//  ParseSerialization.swift
//  ChurchTemplate
//
//  Created by stephen sam kingston on 2/22/17.
//  Copyright © 2017 stephen sam kingston. All rights reserved.
//

import UIKit
import CoreData

class ParseSerialization {

    static let sharedInstance = ParseSerialization()
    
    var searchResults = [Temperature]()

    func pareseTemperature(_ data: Data?,completion:(_ _searchResults:[String])->Void) {
            searchResults.removeAll()
            do {
                if let data = data, let response = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions(rawValue:0)) as? [String] {
                    completion(response)
                } else {
                    print("JSON Error")
                }
            } catch let error as NSError {
                print("Error parsing results: \(error.localizedDescription)")
            }
        
        }
    
    func pareseConfig(_ data: Data?,completion:(_ _searchResults:[String: AnyObject])->Void) {
        do {
            if let data = data, let response = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions(rawValue:0)) as? [String: AnyObject]{
               completion(response)
            }
        }
    catch let error as NSError {
            print("Error parsing results: \(error.localizedDescription)")
        }
      }
}
