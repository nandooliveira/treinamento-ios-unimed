//
//  ViewController.swift
//  Lista Colaboradores
//
//  Created by Fernando Oliveira on 14/01/17.
//  Copyright © 2017 Unimed Maceió. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let colaboradores: [Colaborador] = [
        Colaborador(nome: "Rosemberg", email: "roro@unimedmaceio.com.br"),
        Colaborador(nome: "Lucas", email: "lucas_roro@unimedmaceio.com.br"),
        Colaborador(nome: "Pedro", email: "pedro_potter@unimedmaceio.com.br"),
        Colaborador(nome: "Cicero", email: "sensei@unimedmaceio.com.br"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colaboradores.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identificador = "celula"
        
        let celula = tableView.dequeueReusableCell(withIdentifier: identificador)

        let colaborador = colaboradores[indexPath.row]
        celula?.textLabel?.text = colaborador.nome
        celula?.detailTextLabel?.text = colaborador.email
        
        return celula!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let rightNavController = self.splitViewController?.viewControllers.last as! UINavigationController
        let detalhesViewController = rightNavController.topViewController as! DetalhesViewController
        
        detalhesViewController.refreshUI(colaborador: colaboradores[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Unimed Maceió"
    }
}
