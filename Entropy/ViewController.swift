//
//  ViewController.swift
//  Entropy
//
//  Created by Matthew Chess on 1/13/16.
//  Copyright © 2016 Matthew Chess. All rights reserved.
//

import UIKit
import CoreLocation

//let currentLocation: GPSLocation = GPSLocation()

class ViewController: UIViewController {
    
    private let apiKey = "537f77ccad5dbbd021a9f1a26242f493"
    
    var weeklyWeather: [FiveDayWeatherData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(currentLocation.lat)
    }
    
    override func viewDidAppear(animated: Bool) {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "retrieveWeatherForcast", name: "myLocationNotificationKey", object: nil)
    }
    
    func retrieveWeatherForcast() {
        let forcastService = OWInterface(APIKey: apiKey)
        forcastService.getCurrentWeather(currentLocation.lat, long: currentLocation.long) {
            (let forcast) in
            if let weatherForcast = forcast,
                let currentWeather = weatherForcast.currentWeather {
                    print(currentWeather)
                    dispatch_async(dispatch_get_main_queue()) {
                        if let currentTemp = currentWeather.temperature {
                            //                                self.currentTempLabel?.text = "\(currentTemp)"
                            print("the temp is \(currentTemp)")
                    }
                }
            }
        }
    }
    
    
    @IBAction func fiveDay(sender: UIButton) {
        let dayforcastSerivce = OWInterface(APIKey: apiKey)
        dayforcastSerivce.getFiveDayForcast(currentLocation.lat, long: currentLocation.long) {
            (let newForcast) in
             let newWeatherForcast = newForcast?.fiveDayWeather
            print(newWeatherForcast)
        }

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}