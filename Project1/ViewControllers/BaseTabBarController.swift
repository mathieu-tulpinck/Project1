//
//  BaseTabBarController.swift
//  Project1
//
//  Created by mathieu on 06/05/2021.
//

import UIKit
import CoreLocation

class BaseTabBarController: UITabBarController {
    
    let vaccinationCenter1 = VaccinationCenter(name: "Namur Expo", address: Address(postCode: 5000, commune: "Namur", street: "av. Sergent Vrithoff", buildingNumber: 2), coordinates: CLLocationCoordinate2D(latitude: 50.46699406994812, longitude: 4.848334237713486), phoneNumber: "081253555", centerImage: UIImage(named: "center"))
    let vaccinationCenter2 = VaccinationCenter(name: "Clinique Saint-Luc", address: Address(postCode: 5000, commune: "Namur", street: "rue Saint-Luc", buildingNumber: 8), coordinates:CLLocationCoordinate2D(latitude: 50.47754246480081, longitude: 4.881019860154125), phoneNumber: "081209111", centerImage: UIImage(named: "center"))
    let vaccinationCenter3 = VaccinationCenter(name: "Fosses-la-Ville - Hall Omnisports", address: Address(postCode: 5070, commune: "Fosses-la-Ville", street: "chaussée de Namur", buildingNumber: 69), coordinates: CLLocationCoordinate2D(latitude: 50.401356203624196, longitude: 4.737021365408465), phoneNumber: "081209123", centerImage: UIImage(named: "center"))
    let vaccinationCenter4 = VaccinationCenter(name: "Site de la Croisette à Gedinne", address: Address(postCode: 5575, commune: "Gedinne", street: "rue de la Croisette", buildingNumber: 13), coordinates: CLLocationCoordinate2D(latitude: 49.978523308564434, longitude: 4.937977765093265), phoneNumber: "081209453", centerImage: UIImage(named: "center"))
    let vaccinationCenter5 = VaccinationCenter(name: "WEX", address: Address(postCode: 6900, commune: "Marche-en-Famenne", street: "rue des Deux Provinces", buildingNumber: 1), coordinates: CLLocationCoordinate2D(latitude: 50.247061336817154, longitude: 5.340122680633416), phoneNumber: "084509123", centerImage: UIImage(named: "center"))
    let vaccinationCenter6 = VaccinationCenter(name: "CEME – Charleroi Espace Meeting Européen", address: Address(postCode: 6020, commune: "Charleroi", street: "rue des Français", buildingNumber: 147), coordinates: CLLocationCoordinate2D(latitude: 50.42369409112639, longitude: 4.435570445015848), phoneNumber: "081209453", centerImage: UIImage(named: "center"))

    

    var vaccinationCenters: [VaccinationCenter] {
        return [vaccinationCenter1, vaccinationCenter2, vaccinationCenter3, vaccinationCenter4, vaccinationCenter5, vaccinationCenter6]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
