//
//  ViewController.swift
//  Calculo de IMC
//
//  Created by Fernando Oliveira on 10/12/16.
//  Copyright © 2016 Unimed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldPeso: UITextField!
    @IBOutlet weak var textFieldAltura: UITextField!
    @IBOutlet weak var labelResultado: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func calcularIMC(_ sender: Any) {
        let peso = Float(textFieldPeso.text!)!
        let altura = Float(textFieldAltura.text!)! / 100.0
        
        let imc = peso / (altura * altura)
        var texto = ""
        
        if imc < 17 {
            texto = "Muito Abaixo do Peso"
        } else if imc >= 17 && imc <= 18.49 {
            texto = "Abaixo do Peso"
        } else if imc >= 18.5 && imc <= 25.99 {
            texto = "Peso Normal"
        } else if imc >= 25 && imc <= 29.99 {
            texto = "Acima do Peso"
        } else if imc >= 30 && imc <= 34.99 {
            texto = "Obesidade I"
        } else if imc >= 35 && imc <= 39.99 {
            texto = "Obesidade II"
        } else {
            texto = "Obesidade III"
        }
        
        labelResultado.text = String(imc) + "\n" + texto
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

