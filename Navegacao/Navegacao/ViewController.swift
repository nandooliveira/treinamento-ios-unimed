//
//  ViewController.swift
//  Navegacao
//
//  Created by Fernando Oliveira on 13/12/16.
//  Copyright © 2016 Unimed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowSegundaTela" {
            let viewController = segue.destination as! SegundaViewController

            viewController.nome = "Tonho da Lua!"
            
        }
    }


}

