//
//  ImageViewController.swift
//  Project1
//
//  Created by mathieu on 04/05/2021.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet weak var centerImageView: UIImageView!
    
    var vaccinationCenter: VaccinationCenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        centerImageView.image = vaccinationCenter?.centerImage
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
