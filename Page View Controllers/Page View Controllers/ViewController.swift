//
//  ViewController.swift
//  Page View Controllers
//
//  Created by Fernando Oliveira on 14/01/17.
//  Copyright © 2017 Unimed Maceió. All rights reserved.
//

import UIKit

class ViewController: UIPageViewController, UIPageViewControllerDelegate {
    
    let pageViewDataSource = PageViewDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.delegate = self
        self.setViewControllers([pageViewDataSource.viewControllers[0]], direction: .forward, animated: true) { done in }
        
        self.dataSource = pageViewDataSource
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func pageViewController(_ pageViewController: UIPageViewController, spineLocationFor orientation: UIInterfaceOrientation) -> UIPageViewControllerSpineLocation {
        
        let currentViewController = self.viewControllers?[0] as! DataViewController
        var viewControllers:[DataViewController]!
        let indexOfCurrentViewController = currentViewController.index
        
        if indexOfCurrentViewController! < 2 || indexOfCurrentViewController! == 0 {
            let nextViewController = self.pageViewDataSource.pageViewController(self, viewControllerAfter: currentViewController)
            viewControllers = [currentViewController, nextViewController as! DataViewController]
        } else {
            let previousViewController = self.pageViewDataSource.pageViewController(self, viewControllerBefore: currentViewController)
            viewControllers = [previousViewController as! DataViewController, currentViewController]
        }
        
        self.setViewControllers(viewControllers, direction: .forward, animated: true, completion: {done in })
        
        return .mid
    }

}

