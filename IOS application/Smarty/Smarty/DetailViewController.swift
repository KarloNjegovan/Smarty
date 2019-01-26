//
//  DetailViewController.swift
//  Smarty
//
//  Created by Matija on 26/01/2019.
//  Copyright © 2019 Matija. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

   
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var moist: UILabel!
    var meas: Measurement?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let mes = meas{
                navigationItem.title = mes.uuid
                temp.text = String(mes.temp)
                moist.text = String(mes.moist)
        }

    }


}
