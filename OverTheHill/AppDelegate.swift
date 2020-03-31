//
//  AppDelegate.swift
//  OverTheHill
//
//  Created by Juneyoung Kim on 2020-02-23.
//  Copyright © 2020 Juneyoung Kim. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let config = Realm.Configuration(
                   // Get the URL to the bundled file
                   fileURL: Bundle.main.url(forResource: "Homes", withExtension: "realm"),
                   // Open the file in read-only mode as application bundles are not writeable
                   readOnly: true)
        
               // Open the Realm with the configuration
               let realm = try! Realm(configuration: config)
        
               // Read some data from the bundled Realm
               let results = realm.objects(Homes.self)
               
        print(results)
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

