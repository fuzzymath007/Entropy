//
//  OWInterface.swift
//  Entropy
//
//  Created by Matthew Chess on 1/19/16.
//  Copyright © 2016 Matthew Chess. All rights reserved.
//

import Foundation

struct OWInterface {
    
    let OWAPIKey : String
    
    init(APIKey: String) {
        self.OWAPIKey = APIKey
    }
    
    
    func getCurrentWeather(lat: Double, long: Double, compleation: (CurrentWeatherLoader? -> Void)) {
        
        if let forcastURL = NSURL(string: "http://api.openweathermap.org/data/2.5/weather?APPID=b54eb7c2b171ef6c83730b0efd03e1e5&lat=\(lat)&lon=\(long)") {
            let networkOperation = NetworkRequest(url: forcastURL)
            networkOperation.downloadJSONFromURL{
                (let JSONDictionary) in
                let forcast = CurrentWeatherLoader(weatherDictionary: JSONDictionary)
                compleation(forcast)
                print(forcast)
            }
        } else {
            print("Could not make URL")
        }
    }
    
    func getFiveDayForcast(lat: Double, long: Double, compleation: (FiveDayWeatherLoader? -> Void)) {
        
        if let forcastURL = NSURL(string: "http://api.openweathermap.org/data/2.5/forecast/daily?APPID=b54eb7c2b171ef6c83730b0efd03e1e5&lat=\(lat)&lon=\(long)") {
            let networkOperation = NetworkRequest(url: forcastURL)
            networkOperation.downloadJSONFromURL{
                (let JSONDictionary) in
                let forcast = FiveDayWeatherLoader(weatherDictionary: JSONDictionary)
                compleation(forcast)
                print(forcast)
            }
        } else {
            print("Could not make URL")
        }
    }
}