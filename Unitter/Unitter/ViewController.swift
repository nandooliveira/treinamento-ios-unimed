//
//  ViewController.swift
//  Unitter
//
//  Created by Fernando Oliveira on 14/01/17.
//  Copyright © 2017 Unimed Maceió. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        tabBarItem = UITabBarItem(title: "Unittes", image: UIImage(named: "logo_unimed.png"), tag: 0)
        tabBarItem.badgeValue = "10"
        tabBarItem.badgeColor = UIColor.green
    }
    
    @IBAction func mostrarNotificacoes(_ sender: Any) {
        tabBarController?.selectedViewController = tabBarController?.viewControllers?[1]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

