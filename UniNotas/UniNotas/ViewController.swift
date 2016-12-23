//
//  ViewController.swift
//  UniNotas
//
//  Created by Fernando Oliveira on 22/12/16.
//  Copyright © 2016 Unimed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let notaAtual = UserDefaults.standard.object(forKey: "nota")
        
        if notaAtual != nil {
            textView.text = notaAtual as! String
        }
        
    }

    @IBAction func salvarNota(_ sender: Any) {
        UserDefaults.standard.set(textView.text, forKey: "nota")
        
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

