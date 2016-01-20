//
//  WeeklyTableViewController.swift
//  Entropy
//
//  Created by Matthew Chess on 1/19/16.
//  Copyright © 2016 Matthew Chess. All rights reserved.
//

import UIKit
import CoreLocation

let currentLocation: GPSLocation = GPSLocation()

class WeeklyTableViewController: UITableViewController {
    
    @IBOutlet weak var currentTempLabel: UILabel!
    
    private let apiKey = "537f77ccad5dbbd021a9f1a26242f493"
    
    var weeklyWeather: [FiveDayWeatherData] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Some Title"
        
        print(currentLocation.lat)

    }
    
    override func viewDidAppear(animated: Bool) {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "retrieveWeatherForcast", name: "myLocationNotificationKey", object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
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
                            self.currentTempLabel.text = "\(currentTemp)"
                            print("the temp is \(currentTemp)")
                        }
                    }
            }
        }
        let dayforcastSerivce = OWInterface(APIKey: apiKey)
        dispatch_async(dispatch_get_main_queue()) {
        dayforcastSerivce.getFiveDayForcast(currentLocation.lat, long: currentLocation.long) {
            (let newForcast) in
            let newWeatherForcast = newForcast?.fiveDayWeather
            self.weeklyWeather = (newWeatherForcast)!
            print(newWeatherForcast)
            self.tableView.reloadData()
        }
        }
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("the number of rwos is \(weeklyWeather.count)")
        return weeklyWeather.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! DailyWeatherTableViewCell
        
        let dailyWeather = weeklyWeather[indexPath.row]
        cell.dayLabel.text = dailyWeather.day
        cell.dayHighTemp.text = "\(dailyWeather.maxTemperature!)"
        cell.dailyLowTemp.text = "\(dailyWeather.minTemperature!)"
        
        return cell
    }


}
