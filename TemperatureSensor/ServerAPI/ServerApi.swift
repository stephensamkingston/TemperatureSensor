//
//  ServerApi.swift
//  ChurchTemplate
//
//  Created by stephen sam kingston on 2/22/17.
//  Copyright © 2017 stephen sam kingston. All rights reserved.
//

import UIKit

class ServerApi{
    
    static let sharedInstance = ServerApi()
    
    func getData(urlString:String,completion: @escaping (_ result: Data) -> Void) {
        
         let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
         var dataTask: URLSessionDataTask?
    
         if dataTask != nil {
         dataTask?.cancel()
         }
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let url = URL(string:urlString)
        
        dataTask = defaultSession.dataTask(with: url!, completionHandler: {
          data, response, error in
        
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
                // 7
                if let error = error {
                    print(error.localizedDescription)
                    //Add alert in this particular place
                } else if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                     completion(data!)
                    }
                }
            })
            dataTask?.resume()
        }
     }

