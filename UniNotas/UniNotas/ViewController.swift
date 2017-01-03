//
//  ViewController.swift
//  UniNotas
//
//  Created by Fernando Oliveira on 22/12/16.
//  Copyright © 2016 Unimed. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    var context: NSManagedObjectContext!
    var notaSelecionada:Nota?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        context = delegate.persistentContainer.viewContext
        
        if notaSelecionada != nil {
            textView.text = notaSelecionada?.texto
        }
    }

    @IBAction func salvarNota(_ sender: Any) {
        let nota:Nota!
        
        nota = notaSelecionada == nil ? Nota(context: context) : notaSelecionada
        
        nota.texto = textView.text
        nota.ultimaAlteracao = NSDate()
        
        do {
            try context.save()
        } catch {
            print("quebrou")
        }
        
        let alert = UIAlertController(title: "Sucesso!", message: "Nota Salva!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default) { (action) in
            self.textView.resignFirstResponder()
        })
        
        present(alert, animated: true, completion: nil)
        self.textView.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

