//
//  TableViewController.swift
//  Project1
//
//  Created by mathieu on 03/05/2021.
//

import UIKit
import CoreLocation


class TableViewController: UITableViewController {
    
    var vaccinationCenters = BaseTabBarController.init().vaccinationCenters
    
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
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath)
            -> UISwipeActionsConfiguration? {
            let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (_, _, completionHandler) in
                self.vaccinationCenters.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                completionHandler(true)
            }
            deleteAction.backgroundColor = .systemRed
            let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
            return configuration
    }

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

//custom cell used to populate the table view
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
