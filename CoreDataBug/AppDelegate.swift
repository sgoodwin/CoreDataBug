//
//  AppDelegate.swift
//  CoreDataBug
//
//  Created by Samuel Ryan Goodwin on 5/5/17.
//  Copyright © 2017 Roundwall Software. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let context = persistentContainer.viewContext
        context.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        
        let a = A(context: context)
        a.name = "I'm alive"
        let b = B(context: context)
        b.name = "I'm also alive"
        a.thing = b
        
        try! context.save()
        
        let controller = window?.rootViewController as! ViewController
        controller.container = persistentContainer
        
        return true
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataBug")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
}

