//
//  ViewController.swift
//  Onde Eu Estou
//
//  Created by Fernando Oliveira on 27/12/16.
//  Copyright © 2016 Lotbox. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapa: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let localizacao = CLLocationCoordinate2D(latitude: -9.621802, longitude: -35.7384628)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegionMake(localizacao, span)
        
        mapa.setRegion(region, animated: true)
        
        let pinoUnimed = MKPointAnnotation()
        pinoUnimed.coordinate = localizacao
        pinoUnimed.title = "SEDE Unimed Maceió"
        pinoUnimed.subtitle = "Gruta de Lourdes"

        mapa.addAnnotation(pinoUnimed)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

