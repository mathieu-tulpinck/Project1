//
//  DetailsViewController.swift
//  Project1
//
//  Created by mathieu on 04/05/2021.
//

import UIKit
import MapKit

class DetailsViewController: UIViewController {
    
    var vaccinationCenter: VaccinationCenter?
    
    @IBOutlet weak var centerImageView: UIImageView!{
        didSet {
            centerImageView.isUserInteractionEnabled = true
        }
    }
    @IBOutlet weak var centerName: UILabel!
    @IBOutlet weak var centerAddress: UILabel!
    @IBOutlet weak var centerPhoneNumber: UILabel!
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        mapView.delegate = self
        
        centerImageView.image = vaccinationCenter?.centerImage
        centerName.text = vaccinationCenter?.name
        centerAddress.text = "\(vaccinationCenter!.address!.postCode) \(vaccinationCenter!.address!.commune), \(vaccinationCenter!.address!.street) \(vaccinationCenter!.address!.buildingNumber)"
        centerPhoneNumber.text = vaccinationCenter?.phoneNumber
        
        //registers annotation on map view
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        let vaccinationCenterAnnotation = VaccinationCenterAnnotation(coordinate: vaccinationCenter!.coordinates!, title: vaccinationCenter?.name)
        mapView.addAnnotation(vaccinationCenterAnnotation)
        
        //centers map on vaccination center
        let region = MKCoordinateRegion(center: vaccinationCenterAnnotation.coordinate, latitudinalMeters: 20000, longitudinalMeters: 20000)
        mapView.setRegion(region, animated: true)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let imageVC = segue.destination as? ImageViewController, segue.identifier == "imageViewSegue" {
            imageVC.vaccinationCenter = vaccinationCenter
        }
    }
    
    @IBAction func didTapImageView(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "imageViewSegue", sender: self)
    }
}

extension DetailsViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let vaccinationCenterAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) as? MKMarkerAnnotationView {
            vaccinationCenterAnnotationView.animatesWhenAdded = true
            vaccinationCenterAnnotationView.titleVisibility = .adaptive
            
            return vaccinationCenterAnnotationView
        }
        return nil
    }
    
}
