//
//  ViewController.swift
//  Onde Eu Estou
//
//  Created by Fernando Oliveira on 27/12/16.
//  Copyright © 2016 Lotbox. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapa: MKMapView!
    @IBOutlet weak var speedView: UIView!
    @IBOutlet weak var labelSpeed: UILabel!
    @IBOutlet weak var labelLatitude: UILabel!
    @IBOutlet weak var labelLongitude: UILabel!
    @IBOutlet weak var labelAddress: UILabel!
    
    var locationManager = CLLocationManager()
    var pinoUnimed = MKPointAnnotation()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        let localizacao = CLLocationCoordinate2D(latitude: -9.621802, longitude: -35.7384628)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegionMake(localizacao, span)
        
        mapa.setRegion(region, animated: true)
        
        pinoUnimed.coordinate = localizacao
        pinoUnimed.title = "SEDE Unimed Maceió"
        pinoUnimed.subtitle = "Gruta de Lourdes"

        mapa.addAnnotation(pinoUnimed)
        
        self.roundSpeedView()
    }
    
    func roundSpeedView () {
        self.speedView.layer.cornerRadius = 40.0
        self.speedView.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
    
        labelSpeed.text = String(format: "%.0f km/h", location!.speed * 3.6)
        
        labelLatitude.text = location?.coordinate.latitude.description
        labelLongitude.text = location?.coordinate.longitude.description
        
        pinoUnimed.coordinate = (location?.coordinate)!
        
        updateAddress(location: location!)
        updateMapCamera(location: pinoUnimed.coordinate)
    }
    
    func updateMapCamera(location: CLLocationCoordinate2D) {
        // update map camera
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegionMake(location, span)
        
        mapa.setRegion(region, animated: true)
    }
    
    func updateAddress(location: CLLocation) {
        
        CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
            let placemark = placemarks?[0]
            var address = ""
            
            if placemark?.thoroughfare != nil {
                address += (placemark?.thoroughfare)!
            }
            
            if placemark?.locality != nil {
                address += ", " + (placemark?.locality)! + "."
            }
            
            if placemark?.country != nil {
                address += (placemark?.country)! + "."
            }
            
            self.labelAddress.text = address
        }

    }
    
}









