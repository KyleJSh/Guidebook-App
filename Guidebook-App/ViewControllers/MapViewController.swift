//
//  MapViewController.swift
//  Guidebook-App
//
//  Created by Kyle Sherrington on 2021-03-15.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    // MARK: - Variables and Properties
    
    @IBOutlet weak var mapView: MKMapView!
    
    var place:Place?
    
    // MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if place != nil {
            
            // Create a CLLocation2D
            let location = CLLocationCoordinate2D(latitude: place!.lat, longitude: place!.long)
            
            // Create a pin
            let pin = MKPointAnnotation()
            pin.coordinate = location
            
            // Add it to the map
            mapView.addAnnotation(pin)
            
            // Create a region to zoom to
            let region = MKCoordinateRegion(center: location, latitudinalMeters: 100, longitudinalMeters: 100)
            
            mapView.setRegion(region, animated: false)
        }
        
    }
    

}
