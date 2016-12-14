//
//  ViewController.swift
//  Sorteio
//
//  Created by Fernando Oliveira on 13/12/16.
//  Copyright © 2016 Unimed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultado: UILabel!
    let nomes: [String] = ["Lucas", "Pedro I", "Rosemberg", "Pedro II", "Sensei Cicero"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sortearNumeros(_ sender: Any) {
        let index = Int(arc4random_uniform(UInt32(nomes.count)))
        resultado.text = nomes[index]
    }

}

