//
//  VaccinationCenter.swift
//  Project1
//
//  Created by mathieu on 03/05/2021.
//

import Foundation
import CoreLocation
import UIKit

struct VaccinationCenter {

    let name: String?
    let address: Address?
    let coordinates: CLLocationCoordinate2D?
    let phoneNumber: String?
    let centerImage: UIImage?
    
    init(name: String?, address: Address?, coordinates: CLLocationCoordinate2D?, phoneNumber: String?, centerImage: UIImage?) {
        self.name = name
        self.address = address
        self.coordinates = coordinates
        self.phoneNumber = phoneNumber
        self.centerImage = centerImage
    }
    
    init(_ vaccinationCenter:VaccinationCenter) {
        self.name = vaccinationCenter.name
        self.address = Address(postCode: vaccinationCenter.address!.postCode, commune: vaccinationCenter.address!.commune, street: vaccinationCenter.address!.street, buildingNumber: vaccinationCenter.address!.buildingNumber)
        self.coordinates =  vaccinationCenter.coordinates
        self.phoneNumber = vaccinationCenter.phoneNumber
        self.centerImage = vaccinationCenter.centerImage
    }
    
}

struct Address {
    let postCode: Int
    let commune: String
    let street: String
    let buildingNumber: Int
}




