//
//  ViewController.swift
//  Gestos
//
//  Created by Fernando Oliveira on 12/01/17.
//  Copyright © 2017 Fernando Oliveira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tapView: UIView!
    @IBOutlet weak var rotateView: UIView!
    @IBOutlet weak var longPressView: UIView!
    @IBOutlet weak var swipeView: UILabel!
    @IBOutlet weak var dragView: UIView!
    @IBOutlet weak var pinchView: UIView!

    let tapRec = UITapGestureRecognizer()
    let pinchRec = UIPinchGestureRecognizer()
    let swipeRec = UISwipeGestureRecognizer()
    let longPressRec = UILongPressGestureRecognizer()
    let rotateRec = UIRotationGestureRecognizer()
    let panRec = UIPanGestureRecognizer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tapRec.addTarget(self, action: #selector(ViewController.tappedView))
        tapView.addGestureRecognizer(tapRec)
        
        rotateRec.addTarget(self, action: #selector(ViewController.rotatedView))
        rotateView.addGestureRecognizer(rotateRec)
        
        swipeRec.addTarget(self, action: #selector(ViewController.swippedView))
        swipeView.addGestureRecognizer(swipeRec)
        
        longPressRec.addTarget(self, action: #selector(ViewController.longPressed))
        longPressView.addGestureRecognizer(longPressRec)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tappedView() {
        print("tapped")
    }
    
    func rotatedView() {
        print("rotated")
    }
    
    func longPressed () {
        print("long pressed")
    }
    
    func swippedView() {
        print("swipped")
    }
}

