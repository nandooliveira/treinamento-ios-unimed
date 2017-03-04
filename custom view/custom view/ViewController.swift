//
//  ViewController.swift
//  custom view
//
//  Created by Fernando Oliveira on 21/01/17.
//  Copyright © 2017 Unimed Maceió. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let myButton = UIButton(frame: CGRect(x: 0, y: self.view.frame.height - 40, width: 200.0, height: 40.0))
        myButton.setTitle("Meu Botão", for: UIControlState.normal)
        myButton.setTitleColor(UIColor.red, for: UIControlState.normal)
        myButton.backgroundColor = UIColor.black
        view.addSubview(myButton)
        
        self.view.layoutIfNeeded()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

