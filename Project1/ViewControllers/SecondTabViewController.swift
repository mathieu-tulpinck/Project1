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
            VaccinationCenterAnnotation(coordinate: $0.coordinates!, title: $0.name, subtitle: $0.address?.commune)
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
        
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(VaccinationCenterAnnotation.self))
        for vaccinationCenterAnnotation in vaccinationCentersAnnotations {
            mapView.addAnnotation(vaccinationCenterAnnotation)
        }
    }
}

extension SecondTabViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        var annotationView: MKAnnotationView?
        if let annotation = annotation as? VaccinationCenterAnnotation {
            annotationView = setupVaccinationCenterAnnotationView(for: annotation, on: mapView)
        }
        
        return annotationView
    }
    
    private func setupVaccinationCenterAnnotationView(for annotation: VaccinationCenterAnnotation, on mapView: MKMapView) -> MKAnnotationView {
        let identifier = NSStringFromClass(VaccinationCenterAnnotation.self)
        let view = mapView.dequeueReusableAnnotationView(withIdentifier: identifier, for: annotation)
        if let markerAnnotationView = view as? MKMarkerAnnotationView {
            markerAnnotationView.animatesWhenAdded = true
            markerAnnotationView.canShowCallout = true
            markerAnnotationView.titleVisibility = .adaptive
            markerAnnotationView.subtitleVisibility = .adaptive
            let imageView = UIImage(named: "center")
            let size = CGSize(width: 50, height: 50)
            UIGraphicsBeginImageContext(size)
            imageView!.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
            let resizedImageView = UIGraphicsGetImageFromCurrentImageContext()
            markerAnnotationView.detailCalloutAccessoryView = UIImageView(image: resizedImageView)
        }
        
    return view
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

//attempt to constrain map view to user location and closest vaccination center
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


