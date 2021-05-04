//
//  TableViewController.swift
//  Project1
//
//  Created by mathieu on 03/05/2021.
//

import UIKit
import CoreLocation

let vaccinationCenter1 = VaccinationCenter(name: "Namur Expo", address: Address(postCode: 5000, commune: "Namur", street: "av. Sergent Vrithoff", buildingNumber: 2), coordinates: CLLocationCoordinate2D(latitude: 50.46699406994812, longitude: 4.848334237713486), phoneNumber: "081253555", centerImage: UIImage(named: "center"))
let vaccinationCenter2 = VaccinationCenter(name: "Clinique Saint-Luc", address: Address(postCode: 5000, commune: "Namur", street: "rue Saint-Luc", buildingNumber: 8), coordinates:CLLocationCoordinate2D(latitude: 50.47754246480081, longitude: 4.881019860154125), phoneNumber: "081209111", centerImage: UIImage(named: "center"))

var vaccinationCenters: [VaccinationCenter] = [vaccinationCenter1, vaccinationCenter2]

class TableViewController: UITableViewController {
    
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return vaccinationCenters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let center = vaccinationCenters[indexPath.row]
        //instantiating the use of a reusable UITableViewCell with the identifier of "centerCell", of the CenterCell class
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "centerCell", for: indexPath) as? CenterCell else {
            return UITableViewCell()
        }
        
        //configure the cell
        cell.setup(center: center)

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let centerDetailVC = segue.destination as? DetailsViewController, segue.identifier == "detailsViewSegue", let selectedIndex = tableView.indexPathForSelectedRow {
            centerDetailVC.vaccinationCenter = VaccinationCenter(vaccinationCenters[selectedIndex.row])
        }
    }
}

class CenterCell: UITableViewCell {
    @IBOutlet weak var centerImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var communeLabel: UILabel!
    
    func setup(center: VaccinationCenter) {
        centerImageView.image = center.centerImage
        nameLabel.text = center.name
        communeLabel.text = center.address?.commune
    }
    
}
