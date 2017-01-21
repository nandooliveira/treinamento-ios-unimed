//
//  ViewController.swift
//  PodsExample
//
//  Created by Elton Santos on 17/01/17.
//  Copyright © 2017 Elton Santos. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Alamofire.request("http://transparencia.al.gov.br/licitacao/json-editais/?data_realizacao_dti_=01/01/2015&data_realizacao_dtf_=31/12/2015&limit=2&offset=0").responseJSON { response in
            debugPrint(response)
            
            if let json = response.result.value {
                print("JSON: \(json)")
            }
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

