//
//  ViewController.swift
//  Signos
//
//  Created by Fernando Oliveira on 15/12/16.
//  Copyright © 2016 Unimed. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var signos: [String] = ["Aquario", "Peixes", "Aries", "Touro", "Gemeos", "Cancer", "Leao", "Virgem", "Libra", "Escorpiao", "Sagitario", "Capricornio"]
    
    var frases: [String] = [
        "Você está cheio de peixes, alimente-os agora.",
        "Você está dentro do aquário serás alimentado em breve.",
        "Você é um cavaleiro do Zodiaco",
        "...", "...", "...", "...", "...", "...", "...", "...", "...",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return signos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "celula")
        
        cell?.textLabel?.text = signos[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let signoSelecionado = signos[indexPath.row]
        let fraseSelecionada = frases[indexPath.row]
        
        let alertController = UIAlertController(title: signoSelecionado, message: fraseSelecionada, preferredStyle: .alert)
        
        let acao = UIAlertAction(title: "OK", style: .default, handler: { (action) in print("Supimpa!") })
        
        alertController.addAction(acao)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let acaoEditar = UITableViewRowAction(style: .normal, title: "Editar", handler: { (action, indexPath) in })
        
        let acaoExcluir = UITableViewRowAction(style: .destructive, title: "Remover", handler: { (action, indexPath) in
        
            self.signos.remove(at: indexPath.row)
            self.frases.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        })
        return [acaoExcluir, acaoEditar]
    }

   }

