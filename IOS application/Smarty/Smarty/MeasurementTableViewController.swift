//
//  MeasurementTableViewController.swift
//  Smarty
//
//  Created by Matija on 24/01/2019.
//  Copyright © 2019 Matija. All rights reserved.
//

import UIKit

class MeasurementTableViewController: UITableViewController {

    var mes = [Measurement]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       loadSampleData()
    }

    private func loadSampleData(){
        guard let stat1 = Measurement(uuid: "Stanica 1", time: 1, temp: 25, moist: 46)
            else{
                fatalError("Unable to init stat1")
        }
        
        guard let stat2 = Measurement(uuid: "Stanica 2", time: 1, temp: 27, moist: 34)
            else{
                fatalError("Unable to init stat2")
        }
        
        guard let stat3 = Measurement(uuid: "Stanica 3", time: 1, temp: 26, moist: 35)
            else{
                fatalError("Unable to init stat3")
        }
        
        mes += [stat1,stat2,stat3]
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        if (segue.identifier == "ShowDetail"){
            
        
            guard let mesDetailViewController = segue.destination as? DetailViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedMealCell = sender as? MeasurementTableViewCell else {
                fatalError("Unexpected sender: \(sender)")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedMealCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedMes = mes[indexPath.row]
            mesDetailViewController.meas = selectedMes
        }
        
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "MeasurementTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MeasurementTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MeasurementTableViewCell.")
        }
        
        let insta = mes[indexPath.row]
        
        cell.name.text = insta.uuid
        cell.temp.text = String(insta.temp)
        cell.moist.text = String(insta.moist)
        
        return cell
    }

    

}
