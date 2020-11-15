//
//  MapViewController.swift
//  Estate Rental
//
//  Created by 潘丰 on 12/11/2020.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    var Location = CLLocation(latitude: 22.33787, longitude: 114.18131)
    var estate:String?
    var apart:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Map Controller Launched")
        switch estate {

        case "Heng Fa Chuen": Location = CLLocation(latitude: 22.273808, longitude: 114.244545)

        case "Kornhill": Location = CLLocation(latitude: 22.281352, longitude: 114.221272)

        case "South Horizons": Location = CLLocation(latitude: 22.239734, longitude: 114.151883)

        case "Taikoo Shing": Location = CLLocation(latitude: 22.284817, longitude: 114.221774)

        case "Amoy Gardens":Location =  CLLocation(latitude: 22.322106, longitude: 114.221831)

        case "Laguna City": Location = CLLocation(latitude: 22.302881, longitude: 114.232967)

        case "Laguna Verde": Location = CLLocation(latitude: 22.306500, longitude: 114.196304)
        case "Festival City": Location = CLLocation(latitude: 22.367325, longitude: 114.180717)
        case "Whampoa Garden": Location = CLLocation(latitude: 22.302053, longitude: 114.196045)
        case "Mei Foo Sun Chuen": Location = CLLocation(latitude: 22.333603, longitude: 114.143843)
        case "Telford Gardens": Location = CLLocation(latitude: 22.321558, longitude: 114.217354)
        case "Ocean Shores": Location = CLLocation(latitude: 22.299251, longitude: 114.258549)
        case "LOHAS Park": Location = CLLocation(latitude: 22.291759, longitude: 114.275183)
        case "City One Shatin": Location = CLLocation(latitude: 22.383870,longitude: 114.208370)
        case "Sunshine City": Location = CLLocation(latitude: 22.421597,longitude: 114.237568)
        case "Belvedere Garden": Location = CLLocation(latitude: 22.368532,longitude: 114.107445)
        case "Kingswood Villas": Location = CLLocation(latitude: 22.454645,longitude: 114.008570)
        default: Location = CLLocation(latitude: 22.33787, longitude: 114.18131)

        }
        
        var objectAnnotation = MKPointAnnotation()
        objectAnnotation.coordinate = Location.coordinate
        objectAnnotation.title = apart
        mapView.addAnnotation(objectAnnotation)
        mapView.setCenterLocation(Location)
        mapView.showsUserLocation = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func resetPosition(_ sender: Any) {
        mapView.setCenterLocation(Location)
    }
}

private extension MKMapView {
    
    func setCenterLocation(_ location: CLLocation,
                           regionRadius: CLLocationDistance = 500) {
        
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        
        setRegion(coordinateRegion, animated: true)
    }
    
}
