//
//  ViewController.swift
//  App Supimpa
//
//  Created by Fernando Oliveira on 10/12/16.
//  Copyright © 2016 Unimed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var minhaLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func mudarTexto(_ sender: Any) {
        minhaLabel.text = "Novo texto"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

