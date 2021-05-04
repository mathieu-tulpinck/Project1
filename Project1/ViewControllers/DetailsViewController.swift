//
//  DetailsViewController.swift
//  Project1
//
//  Created by mathieu on 04/05/2021.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var centerImageView: UIImageView!
    @IBOutlet weak var centerName: UILabel!
    @IBOutlet weak var centerAddress: UILabel!
    @IBOutlet weak var centerPhoneNumber: UILabel!
    
    var vaccinationCenter: VaccinationCenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        centerImageView.image = vaccinationCenter?.centerImage
        centerName.text = vaccinationCenter?.name
        centerAddress.text = "\(vaccinationCenter!.address!.postCode) \(vaccinationCenter!.address!.commune), \(vaccinationCenter!.address!.street) \(vaccinationCenter!.address!.buildingNumber)"
        centerPhoneNumber.text = vaccinationCenter?.phoneNumber
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
