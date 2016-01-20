//
//  CurrentWeatherLoader.swift
//  Entropy
//
//  Created by Matthew Chess on 1/19/16.
//  Copyright © 2016 Matthew Chess. All rights reserved.
//

import Foundation

struct CurrentWeatherLoader {
    var currentWeather: CurrentWeatherData?
    
    init(weatherDictionary: [String: AnyObject]?) {
        //Use this method to take the data in the JSON Dictionary that was retreaved in the NetweokRequest and check if it has the correct keys before loading that data into the Current WEather Data struct. 
        
        if let currentWeatherFromJSON = weatherDictionary?["main"] as? [String: AnyObject] {
            currentWeather = CurrentWeatherData(currentWeatherDictionary: currentWeatherFromJSON)
        }

        
    }
    
}
