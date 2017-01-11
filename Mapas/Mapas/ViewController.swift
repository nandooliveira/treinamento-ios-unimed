//
//  ViewController.swift
//  Mapas
//
//  Created by Fernando Oliveira on 03/01/17.
//  Copyright © 2017 Unimed. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    
    @IBOutlet weak var map: MKMapView!
    
    var locations: [CLLocationCoordinate2D] = [
        CLLocationCoordinate2DMake(-9.6396627, -35.7050285),
        CLLocationCoordinate2DMake(-9.427322, -35.5899367),
        CLLocationCoordinate2DMake(-4.6487146, -39.6785516),
        CLLocationCoordinate2DMake(-13.171876, -43.5531487)
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        map.delegate = self
        addPolyline()
        addPolygon()
        addCircle()
        addPoint(location: locations.first!, title: "Maceió", subtitle: "Mangabeiras")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addPoint(location: CLLocationCoordinate2D, title: String, subtitle: String) {
        let point = MKPointAnnotation()
        point.coordinate = location
        point.title = title
        point.subtitle = subtitle

        map.addAnnotation(point)
        map.showsUserLocation = true
    }

    func addPolyline() {
        let polyline = MKPolyline(coordinates: locations, count: locations.count)
        map.add(polyline)
    }

    func addPolygon() {
        let polygon = MKPolygon(coordinates: locations, count: locations.count)
        map.add(polygon)
    }
    
    func addCircle() {
        let circle = MKCircle(center: locations.first!, radius: 100000)
        map.add(circle)
    }
    
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        if overlay is MKPolyline {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = UIColor.orange
            renderer.lineWidth = 3
            
            return renderer
        } else if overlay is MKCircle {
            let renderer = MKCircleRenderer(overlay: overlay)
            renderer.fillColor = UIColor.red.withAlphaComponent(0.2)
            renderer.strokeColor = UIColor.purple
            renderer.lineWidth = 4
            return renderer
        } else if overlay is MKPolygon {
            let renderer = MKPolygonRenderer(overlay: overlay)
            renderer.fillColor = UIColor.black.withAlphaComponent(0.2)
            renderer.strokeColor = UIColor.blue
            renderer.lineWidth = 1
            return renderer
        }
        
        return MKOverlayRenderer()
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "mapicon") ?? MKAnnotationView()
        annotationView.image = UIImage(named: "mapicon")
        annotationView.canShowCallout = true
        
        let right = UIButton(type: .detailDisclosure)
        right.addTarget(self, action: #selector(ViewController.buttonTapped), for: UIControlEvents.touchUpInside)
        annotationView.rightCalloutAccessoryView = right
        
        return annotationView
    }
    
    func buttonTapped () {
        print("Botão Pressionado")
    }
}
