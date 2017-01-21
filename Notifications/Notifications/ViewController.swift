//
//  ViewController.swift
//  Notifications
//
//  Created by Fernando Oliveira on 19/01/17.
//  Copyright © 2017 Unimed Maceió. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func dispatchNotification(_ sender: Any) {
        
        let view = UNNotificationAction(identifier: "view", title: "Ver", options: [])
        let remove = UNNotificationAction(identifier: "remove", title: "Remover", options: [.destructive])
        
        let category = UNNotificationCategory(identifier: "categoria_supimpa", actions: [view, remove], intentIdentifiers: [], options: [])
        
        let center = UNUserNotificationCenter.current()
        center.setNotificationCategories([category])
        
        let content = UNMutableNotificationContent()
        content.title = "Nova notificação!"
        content.subtitle = "minha notificação bacana"
        content.body = "Nova notificação no aplicativo bacana e supimpa"
        content.categoryIdentifier = "categoria_supimpa"
        
        content.sound = UNNotificationSound.default()
        content.badge = NSNumber(value: UIApplication.shared.applicationIconBadgeNumber + 1)
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 15, repeats: false)

        let request = UNNotificationRequest(identifier: "Supimpa", content: content, trigger: trigger)
        
        center.add(request, withCompletionHandler: nil)
        center.delegate = self
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let badgeNumber = UIApplication.shared.applicationIconBadgeNumber
        
        if badgeNumber > 0 {
            UIApplication.shared.applicationIconBadgeNumber -= 1
        }
        
        switch response.actionIdentifier {
        case "view":
            print("view")
        case "remove":
            print("remove")
        default:
            print("none action")
        }
        
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("Will present")
        completionHandler([.badge, .alert, .sound])
    }
}

