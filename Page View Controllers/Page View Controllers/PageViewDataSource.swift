//
//  PageViewDataSource.swift
//  Page View Controllers
//
//  Created by Fernando Oliveira on 14/01/17.
//  Copyright © 2017 Unimed Maceió. All rights reserved.
//

import Foundation
import UIKit

class PageViewDataSource: NSObject, UIPageViewControllerDataSource {
    
    let viewControllers: [DataViewController]!
    
    override init() {
        let controller1 = DataViewController()
        let controller2 = DataViewController()
        let controller3 = DataViewController()
        
        controller1.index = 0
        controller1.index = 1
        controller1.index = 2
        
        viewControllers = [controller1, controller2, controller3]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! DataViewController).index
        if index == nil || index == 0 {
            return nil
        }
        
        index -= 1
        return viewControllers[index]

    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! DataViewController).index!
        
        if index == (viewControllers.count - 1) {
            return nil
        }
        
        index += 1
        return viewControllers[index]
    }
}
