//
//  AppDelegate.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var backgroundTask: UIBackgroundTaskIdentifier = .invalid
    var startTime = DispatchTime.now()
    
    
    func registerBackgroundTask() {
        startTime = DispatchTime.now()
      backgroundTask = UIApplication.shared.beginBackgroundTask { [weak self] in
        self?.endBackgroundTask()
      }
      assert(backgroundTask != .invalid)
      print("Start")
    }
      
    func endBackgroundTask() {
      UIApplication.shared.endBackgroundTask(backgroundTask)
      backgroundTask = .invalid
      print("Duration is \((DispatchTime.now().uptimeNanoseconds - startTime.uptimeNanoseconds)/1000000000) sec")
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       window = UIWindow(frame: UIScreen.main.bounds)
       window!.rootViewController = MyTabBarViewController()
       window!.makeKeyAndVisible()
        

        
        
       return true
   }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
       
        switch UIApplication.shared.applicationState {
        case .active: print("active")
        case .background:
            registerBackgroundTask()
          case .inactive:
            print("ooops")
        @unknown default:
            fatalError()
        }
    }

    // MARK: UISceneSession Lifecycle


}

