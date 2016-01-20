//
//  DailyWeatherTableViewCell.swift
//  Entropy
//
//  Created by Matthew Chess on 1/19/16.
//  Copyright © 2016 Matthew Chess. All rights reserved.
//

import UIKit

class DailyWeatherTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var dayHighTemp: UILabel!
    @IBOutlet weak var dailyLowTemp: UILabel!
    @IBOutlet weak var dailySumImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
