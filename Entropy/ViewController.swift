//
//  ViewController.swift
//  Entropy
//
//  Created by Matthew Chess on 1/13/16.
//  Copyright © 2016 Matthew Chess. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var currentLocation: GPSLocation = GPSLocation()
        
        print(currentLocation.lat)
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}