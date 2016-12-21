//
//  ViewController.swift
//  Transparencia Alagoas
//
//  Created by Fernando Oliveira on 20/12/16.
//  Copyright © 2016 Unimed. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var txtNomeServidor: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var dados: [Dictionary<String, Any>] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buscarDados(_ sender: Any) {
        getData2(nome: txtNomeServidor.text!)
    }
    
    func getData2(nome: String) {
        let url = URL(string: String(format: "http://transparencia.al.gov.br/pessoal/json-servidores/?ano=2016&mes=1000&limit=10&offset=0&nome=%@", nome))
        let request = URLRequest(url: url!)
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if error == nil {
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
                    
                    self.dados = json["rows"] as! [[String:Any]]
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    //Swift 2
                    // dispatch_async(dispatch_get_main_queue()) {
                            // update some UI
                    //}
                    
                } catch {
                    print("Quebrou tudo!")
                }
            }
        }
        
        task.resume()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dados.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "celula")
        
        let dict = self.dados[indexPath.row]
        cell?.textLabel?.text = dict["nome"] as! String?
        cell?.detailTextLabel?.text = dict["total"] as! String?
        
        return cell!
    }
    
//    func getData() {
//        
//        let url = URL(string: "http://transparencia.al.gov.br/pessoal/json-servidores/?ano=2016&mes=10&limit=10&offset=0&nome=Renan")
//        let request = URLRequest(url: url!)
//        
//        NSURLConnection.sendAsynchronousRequest(request, queue: OperationQueue()) { (response, data, error) in
//            
//            if error == nil {
//                
//                do {
//                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
//
//                    print(json)
//                } catch {
//                    print("Quebrou tudo!")
//                }
//            }
//        }
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

