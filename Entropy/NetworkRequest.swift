//
//  NetworkRequest.swift
//  Entropy
//
//  Created by Matthew Chess on 1/14/16.
//  Copyright © 2016 Matthew Chess. All rights reserved.
//

import Foundation

//The Network Request class is instantiated with an url and makes a NSURLRequest based on the URL and returns a JSONDictionary.

//To Fetch weather init an instance of the object and call the function downloadJSONFromURL, a URL must be provided.

class NetworkRequest: NSObject {

    lazy var config: NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
    lazy var session: NSURLSession = NSURLSession(configuration: self.config)
    
    let queryURL: NSURL
    
    typealias JSONDictionaryCompletion = ([String: AnyObject]?) -> Void
    
    init(url: NSURL) {
        self.queryURL = url
    }
    
    func downloadJSONFromURL(completion: JSONDictionaryCompletion) {
        let request : NSURLRequest = NSURLRequest(URL: queryURL)
        let dataTask = session.dataTaskWithRequest(request) {
            (let data, let responce, let error) in
            if let httpResponce = responce as? NSHTTPURLResponse {
                switch(httpResponce.statusCode) {
                case 200:
                    do{
                        let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as? [String: AnyObject]
                            print(jsonDictionary)
                        completion(jsonDictionary)
                    } catch let error as NSError {
                        print("There was an error \(error)")
                    }
                default:
                    print(httpResponce.debugDescription)
                    print("Get request not successful \(httpResponce.statusCode)")
                    
                }
            }else {
                print("Error: This is not a valid HTTP request")
            }
        }
        dataTask.resume()
    }
}