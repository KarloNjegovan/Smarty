//
//  MeasurementTableViewCell.swift
//  Smarty
//
//  Created by Matija on 24/01/2019.
//  Copyright © 2019 Matija. All rights reserved.
//

import UIKit

class MeasurementTableViewCell: UITableViewCell {

    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var moist: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
