//
//  Measurement.swift
//  Smarty
//
//  Created by Matija on 24/01/2019.
//  Copyright © 2019 Matija. All rights reserved.
//

import UIKit

class Measurement {
    
    var uuid: String = ""
    var time: Int
    var temp: Int
    var moist: Int
    
    init?(uuid:String, time:Int, temp:Int, moist:Int) {
        
        if uuid.isEmpty{
            return nil
        }
        
        self.uuid = uuid
        self.time = time
        self.temp = temp
        self.moist = moist
    }
    
    
}
