//
//  ViewController.swift
//  Animations Society
//
//  Created by Fernando Oliveira on 05/01/17.
//  Copyright © 2017 Unimed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var centerAlignSenha: NSLayoutConstraint!
    @IBOutlet weak var centerAlignUsuario: NSLayoutConstraint!
    
    @IBOutlet weak var button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        centerAlignUsuario.constant -= view.bounds.width
        centerAlignSenha.constant -= view.bounds.width
        button.alpha = 0.0
        
        let guia1 = UIImageView(image: UIImage(named: "guia01"))
        guia1.frame = view.frame
        view.insertSubview(guia1, belowSubview: button)
        
        imageFadeIn(imageView: guia1)
    }
    
    func imageFadeIn(imageView: UIImageView) {
        let guia2  = UIImageView(image: UIImage(named: "guia02"))
        guia2.frame = view.frame
        guia2.alpha = 0.0
        
        view.insertSubview(guia2, aboveSubview: imageView)
        
        UIView.animate(withDuration: 2.0, delay: 2.0, options: .curveEaseOut, animations: {
            guia2.alpha = 1.0
        }) {_ in
            imageView.image = guia2.image
            guia2.removeFromSuperview()
        }
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.centerAlignUsuario.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.3, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.centerAlignSenha.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.5, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.button.alpha = 1.0
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func login(_ sender: Any) {
        
        let bounds = self.button.bounds
        
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: UIViewAnimationOptions.curveLinear, animations: {
            self.button.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
            self.button.isEnabled = false
        }, completion: nil)
        
    }
    

}

