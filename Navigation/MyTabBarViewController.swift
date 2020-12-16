//
//  MyTabBarViewController.swift
//  Navigation
//
//  Created by Богдан Киселев on 10.12.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class MyTabBarViewController: UITabBarController {
    
        override func viewDidLoad() {
            super.viewDidLoad()
            let profileVC = ProfileViewController()
            let feedVC = FeedViewController()
            let prof = UINavigationController(rootViewController: profileVC)
            prof.tabBarItem.title = "Profile"
            let feed = UINavigationController(rootViewController: feedVC)
            feed.tabBarItem.title = "Feed"
            self.viewControllers = [prof,feed]
            print(type(of: self), #function)

        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(type(of: self), #function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(type(of: self), #function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(type(of: self), #function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(type(of: self), #function)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(type(of: self), #function)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(type(of: self), #function)
    }

      
    }
