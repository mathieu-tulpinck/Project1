//
//  VaccinationCenterAnnotation.swift
//  Project1
//
//  Created by mathieu on 06/05/2021.
//

import UIKit
import MapKit

class VaccinationCenterAnnotation: NSObject, MKAnnotation {
    @objc dynamic var coordinate: CLLocationCoordinate2D
    var title: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String?) {
        self.coordinate = coordinate
        self.title = title
    }
}


