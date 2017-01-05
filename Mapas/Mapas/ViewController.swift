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
        CLLocationCoordinate2DMake(-9.427322,-35.5899367),
        CLLocationCoordinate2DMake(-4.6487146,-39.6785516)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        map.delegate = self
        addPolyline()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func addPolyline() {
        let polyline = MKPolyline(coordinates: locations, count: locations.count)
        map.add(polyline)
    }

}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        if overlay is MKPolyline {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = UIColor.orange
            renderer.lineWidth = 3
            
            return renderer
        }
        
        return MKOverlayRenderer()
    }
}
