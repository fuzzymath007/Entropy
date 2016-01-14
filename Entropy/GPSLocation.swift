//
//  GPSLocation.swift
//  Entropy
//
//  Created by Matthew Chess on 1/13/16.
//  Copyright © 2016 Matthew Chess. All rights reserved.
//

import Foundation
import CoreLocation

class GPSLocation: NSObject, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager = CLLocationManager()
    
    var long: Double = 0.0
    
    var lat: Double = 0.0
    
    override init() {
        
        print("initing")

        super.init()
        locationManager.delegate = self
        locationManager.distanceFilter  = 3000
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        long = (locationManager.location?.coordinate.longitude)!
        lat = (locationManager.location?.coordinate.latitude)!
        
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        print("didChangeAuthorizationStatus")
        
        switch status {
        case .NotDetermined:
            print(".NotDetermined")
            break
            
        case .AuthorizedWhenInUse:
            print(".Authorized")
            self.locationManager.startUpdatingLocation()
            break
            
        case .Denied:
            print(".Denied")
            break
            
        default:
            print("Unhandled authorization status")
            break
            
        }
    }
    
    //    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
    //        println("Error while updating location " + error.localizedDescription)
    //    }
    
    
    func locationManager(manger: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last as CLLocation!
        
        print("didUpdateLocations:  \(location.coordinate.latitude), \(location.coordinate.longitude)")
        
        lat = location.coordinate.latitude
        long = location.coordinate.longitude
        
        NSNotificationCenter.defaultCenter().postNotificationName("myLocationNotificationKey", object: self)
        
        
    }
    
    func getLocation() -> (Double, Double) {
        let userLat = lat
        let userLong = long
        
        return (userLat, userLong)
        
        
    }
    
}
