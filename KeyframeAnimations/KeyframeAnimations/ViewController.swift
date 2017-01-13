//
//  ViewController.swift
//  KeyframeAnimations
//
//  Created by Fernando Oliveira on 12/01/17.
//  Copyright © 2017 Fernando Oliveira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var alertView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.createView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func createView() {
        // Create a red view
        
        let alertViewFrame: CGRect = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        alertView = UIView(frame: alertViewFrame)
        alertView.backgroundColor = UIColor.red
        
        let imageFrame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height / 2)
        let imageView = UIImageView(frame: imageFrame)
        imageView.image = UIImage(named: "homer")

        alertView.addSubview(imageView)
        
        let button = UIButton(type: .system) as UIButton
        button.setTitle("Fechar", for: .normal)
        button.backgroundColor = UIColor.white
        let buttonWidth: CGFloat = view.bounds.width / 2
        let buttonHeight: CGFloat = 40
        
        button.frame = CGRect(x: alertView.center.x - buttonWidth / 2, y: alertView.center.y - buttonHeight / 2, width: buttonWidth, height: buttonHeight)
        button.addTarget(self, action: #selector(ViewController.fecharAlerta), for: .touchUpInside)
        
        alertView.addSubview(button)

        view.addSubview(alertView)
    }
    
    func fecharAlerta () {
        
        let smallFrame = alertView.frame.insetBy(dx: alertView.frame.size.width / 4, dy: alertView.frame.size.height / 4)
        let finalFrame = smallFrame.offsetBy(dx: 0, dy: alertView.bounds.height)
        
        let snapshot = alertView.snapshotView(afterScreenUpdates: false)
        snapshot?.frame = alertView.frame
        view.addSubview(snapshot!)
        alertView.removeFromSuperview()
        
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: .calculationModeCubic, animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                snapshot?.frame = smallFrame
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
                snapshot?.frame = finalFrame
            })
            
        }, completion: nil)
    }
}

