//
//  FiveDayWeatherLoader.swift
//  Entropy
//
//  Created by Matthew Chess on 1/19/16.
//  Copyright © 2016 Matthew Chess. All rights reserved.
//

import Foundation

struct FiveDayWeatherLoader {
    var fiveDayWeather: [FiveDayWeatherData] = []
    
    init(weatherDictionary: [String: AnyObject]?) {
        //Use this method to take the data in the JSON Dictionary that was retreaved in the NetweokRequest and check if it has the correct keys before loading that data into the Current WEather Data struct.
        
        if let fiveDayWeatherDataFromJASON = weatherDictionary?["list"] as? [[String: AnyObject]] {
            for dailyWeather in fiveDayWeatherDataFromJASON {
                let daily = FiveDayWeatherData(fiveDayWeatherDictionary: dailyWeather)
                fiveDayWeather.append(daily)
            }
        }
    }
}
