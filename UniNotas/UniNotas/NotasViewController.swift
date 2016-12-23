//
//  NotasViewController.swift
//  UniNotas
//
//  Created by Fernando Oliveira on 22/12/16.
//  Copyright © 2016 Unimed. All rights reserved.
//

import UIKit
import CoreData

class NotasViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let busca = NSFetchRequest<NSFetchRequestResult>(entityName: "Nota")
        
        do {
            let notas = try context.fetch(busca)
            for nota in notas as! [NSManagedObject] {
                print(nota.value(forKey: "texto") ?? "no value")
            }
        } catch {
            print("Deu erro")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
