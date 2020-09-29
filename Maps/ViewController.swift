//
//  ViewController.swift
//  Maps
//
//  Created by admin on 05/02/2020.
//  Copyright © 2020 AM Kirsch. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController , MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        let latitude: CLLocationDegrees = 31.77660
        
        let longitude:CLLocationDegrees = 35.23382
  
        let latDelta: CLLocationDegrees = 0.05
        
        let longDelta: CLLocationDegrees = 0.05
        
        
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
    
        let coordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegion(center: coordinates, span: span)
        
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        
        annotation.title = "The Western Wall"
        
        annotation.subtitle = "Makom Kadosh"
        
        annotation.coordinate = coordinates
        
        map.addAnnotation(annotation)
        
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestureRecognizer:)))
        
        uilpgr.minimumPressDuration = 2
        
        map.addGestureRecognizer(uilpgr)
    }


@objc  func longpress(gestureRecognizer: UIGestureRecognizer) {
        
        let touchPoint =  gestureRecognizer.location(in: self.map)
        
        let coordinate = map.convert(touchPoint, toCoordinateFrom: self.map)
        
        let annotation = MKPointAnnotation()
        
        annotation.title = "New Place"
        
        annotation.subtitle = "you long-pressed here"
        
        annotation.coordinate = coordinate
        
        map.addAnnotation(annotation)
    }
    
    
    
    
}

