//
//  FiveDayWeatherData.swift
//  Entropy
//
//  Created by Matthew Chess on 1/19/16.
//  Copyright © 2016 Matthew Chess. All rights reserved.
//

import Foundation
import UIKit

//This class is a model object to structure our current weather data. It contains the current, max, and min temp data.

struct FiveDayWeatherData {
    
    let dailyTemperature: Float?
    let minTemperature: Float?
    let maxTemperature: Float?
    var sum: String?
    var day: String?
    let dateFormatter = NSDateFormatter()
    
    init(fiveDayWeatherDictionary: [String: AnyObject]) {
        
        dailyTemperature = fiveDayWeatherDictionary["temp"]? ["day"] as? Float
        minTemperature = fiveDayWeatherDictionary["temp"]? ["min"] as? Float
        maxTemperature = fiveDayWeatherDictionary["temp"]? ["max"] as? Float
        
        if let x = fiveDayWeatherDictionary["weather"] {
            print("this is \(x)")
            print(x[0]! ["main"]!)
            self.sum = x["main"] as? String
        }
        
        
        if let time = fiveDayWeatherDictionary["dt"] as? Double {
            day = dayStringFromTime(time)
        }
        
    }
    
    func timeStringFromUnixTime(unixTime: Double) -> String {
        let date = NSDate(timeIntervalSince1970: unixTime)
        
        // Returns date formatted as 12 hour time.
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter.stringFromDate(date)
    }
    
    func dayStringFromTime(unixTime: Double) -> String {
        let date = NSDate(timeIntervalSince1970: unixTime)
        dateFormatter.locale = NSLocale(localeIdentifier: NSLocale.currentLocale().localeIdentifier)
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.stringFromDate(date)
    }
    
    
}
