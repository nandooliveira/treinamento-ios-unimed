//
//  NotasViewController.swift
//  UniNotas
//
//  Created by Fernando Oliveira on 22/12/16.
//  Copyright © 2016 Unimed. All rights reserved.
//

import UIKit
import CoreData

class NotasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var notas: [Nota] = []
    var notaSelecionada:Nota?

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let busca: NSFetchRequest<Nota> = Nota.fetchRequest()
        
        do {
            notas = try context.fetch(busca)
            tableView.reloadData()
        } catch {
            print("Deu erro")
        }
        
        notaSelecionada = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - TableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "celulaNota")
        
        let nota = notas[indexPath.row]
        cell?.textLabel?.text = nota.texto
        
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .short
        
//        formatter.dateFormat = "dd/MM/yyyy"
        
        cell?.detailTextLabel?.text = formatter.string(from: nota.ultimaAlteracao as! Date)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        notaSelecionada = notas[indexPath.row]
        performSegue(withIdentifier: "form_notas", sender: self)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let action = UITableViewRowAction(style: .destructive, title: "Remover") { (action, indexPath) in
            let nota = self.notas[indexPath.row]

            nota.managedObjectContext?.delete(nota)
            
            do {
                try nota.managedObjectContext?.save()
            } catch {
                print("erro ao excluir")
            }
            
            self.notas.remove(at: indexPath.row)
            
            // recarregar a tabela
            self.tableView.reloadData()
        }
        
        return [action]
        
    }
    

    
    // MARK: - Segue

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "form_notas" {
            let destinationController = segue.destination as! ViewController
            destinationController.notaSelecionada = self.notaSelecionada
        }
    }

}
