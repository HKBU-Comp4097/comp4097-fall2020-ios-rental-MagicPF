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
        print("The estate is \(estate)")
        switch estate {

        case "Heng Fa Chuen": Location = CLLocation(latitude: 22.2780, longitude: 114.24049)

        case "Kornhill": Location = CLLocation(latitude: 22.2822170, longitude: 114.2162513)

        case "South Horizons": Location = CLLocation(latitude: 22.2435129, longitude: 114.1478051)

        case "Taikoo Shing": Location = CLLocation(latitude: 22.2877476, longitude: 114.2178580)

        case "Amoy Gardens":Location =  CLLocation(latitude: 22.3252633, longitude: 114.2170986)

        case "Laguna City": Location = CLLocation(latitude: 22.3057182, longitude: 114.2281368)

        case "Laguna Verde": Location = CLLocation(latitude: 22.3078141, longitude: 114.1926767)
        case "Festival City": Location = CLLocation(latitude: 22.3695664, longitude: 114.1770934)
        case "Whampoa Garden": Location = CLLocation(latitude: 22.3038422, longitude: 114.1892395)
        case "Mei Foo Sun Chuen": Location = CLLocation(latitude: 22.3358959, longitude: 114.1401903)
        case "Telford Gardens": Location = CLLocation(latitude: 22.3226593, longitude: 114.2135507)
        case "Ocean Shores": Location = CLLocation(latitude: 22.3021389, longitude: 114.2539277)
        case "LOHAS Park": Location = CLLocation(latitude: 22.2947086, longitude: 114.2700149)
        case "City One Shatin": Location = CLLocation(latitude: 22.3865971,longitude: 114.2038186)
        case "Sunshine City": Location = CLLocation(latitude: 22.4226905,longitude: 114.2314804)
        case "Belvedere Garden": Location = CLLocation(latitude: 22.3716688,longitude: 114.1015035)
        case "Kingswood Villas": Location = CLLocation(latitude: 22.4520008,longitude: 114.0018295)
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
