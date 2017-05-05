//
//  ViewController.swift
//  CoreDataBug
//
//  Created by Samuel Ryan Goodwin on 5/5/17.
//  Copyright © 2017 Roundwall Software. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    var container: NSPersistentContainer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let context = container.viewContext
        
        let request = A.fetchRequest() as NSFetchRequest<A>
        let allA = try! context.fetch(request)
        print(allA.map({ $0.thing?.name }))
        let bRequest = B.fetchRequest() as NSFetchRequest<B>
        let allB = try! context.fetch(bRequest)
        print(allB.map({ $0.otherThing?.name }))
    }
}

