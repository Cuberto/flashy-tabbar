//
//  ViewController.swift
//  CBFlashyTabBarController
//
//  Created by askopin@gmail.com on 11/29/2018.
//  Copyright (c) 2018 askopin@gmail.com. All rights reserved.
//

import UIKit
import CBFlashyTabBarController

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnFromCodePressed(_ sender: AnyObject) {
        let eventsVC = CBSampleViewController()
        eventsVC.tabBarItem = UITabBarItem(title: "Events", image: #imageLiteral(resourceName: "Events"), tag: 0)
        let searchVC = CBSampleViewController()
        searchVC.tabBarItem = UITabBarItem(title: "Search", image: #imageLiteral(resourceName: "Search"), tag: 0)
        let activityVC = CBSampleViewController()
        activityVC.tabBarItem = UITabBarItem(title: "Activity", image: #imageLiteral(resourceName: "Highlights"), tag: 0)
        let settingsVC = CBSampleViewController()
        settingsVC.tabBarItem = UITabBarItem(title: "Settings", image: #imageLiteral(resourceName: "Settings"), tag: 0)
        settingsVC.inverseColor()

        let tabBarController = CBFlashyTabBarController()
        tabBarController.viewControllers = [eventsVC, searchVC, activityVC, settingsVC]
//        navigationController?.pushViewController(tabBarController, animated: true)
        self.present(tabBarController, animated: true, completion: nil)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
