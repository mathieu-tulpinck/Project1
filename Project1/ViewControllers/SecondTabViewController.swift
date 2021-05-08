//
//  SecondTabViewController.swift
//  Project1
//
//  Created by mathieu on 03/05/2021.
//

import UIKit
import MapKit

class SecondTabViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    //var boundingRegion: MKCoordinateRegion?
    
    let vaccinationCenters = BaseTabBarController.init().vaccinationCenters
    var vaccinationCentersAnnotations: [VaccinationCenterAnnotation] {
        return vaccinationCenters.map {
            VaccinationCenterAnnotation(coordinate: $0.coordinates!, title: $0.name)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        
        mapView.showsUserLocation = true
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion(center: location, latitudinalMeters: 20000, longitudinalMeters: 20000)
            mapView.setRegion(region, animated: true)
        }
        
        locationManager.startUpdatingLocation()
        
        //registers annotations on map view
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        for vaccinationCenterAnnotation in vaccinationCentersAnnotations {
            mapView.addAnnotation(vaccinationCenterAnnotation)
        }
    }
}

extension SecondTabViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if let vaccinationCentersAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) as? MKMarkerAnnotationView {
            vaccinationCentersAnnotationView.animatesWhenAdded = true
            vaccinationCentersAnnotationView.titleVisibility = .adaptive
            
            return vaccinationCentersAnnotationView
        }
        return nil
    }
}

extension SecondTabViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 20000, longitudinalMeters: 20000)
        mapView.setRegion(region, animated: true)
    }
}

//extension Array where Iterator.Element == VaccinationCenterAnnotation {
//    func closest(to fixedLocation: CLLocation) -> Iterator.Element? {
//        return self.sorted { (vaccinationCenterAnnotation1, vaccinationCenterAnnotation2) -> Bool in
//            let location1 = CLLocation(latitude: vaccinationCenterAnnotation1.coordinate.latitude, longitude: vaccinationCenterAnnotation1.coordinate.longitude)
//            let location2 = CLLocation(latitude: vaccinationCenterAnnotation2.coordinate.latitude, longitude: vaccinationCenterAnnotation2.coordinate.longitude)
//
//            let distanceFromUser1 = fixedLocation.distance(from: location1)
//            let distanceFromUser2 = fixedLocation.distance(from: location2)
//
//            return distanceFromUser1 < distanceFromUser2
//        }.first
//    }
//}


