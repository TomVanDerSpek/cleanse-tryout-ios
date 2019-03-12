//
//  AppDelegate.swift
//  CleanseTryout
//
//  Created by Tom van der Spek on 12/03/2019.
//

import UIKit
import Cleanse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var applicationCoordinator: CoordinatorProtocol!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let propertyInjector: PropertyInjector<AppDelegate> = try! ComponentFactory.of(AppComponent.self).build(())
        
        propertyInjector.injectProperties(into: self)
        
        // window should now be defined
        precondition(window != nil)
        
        window!.makeKeyAndVisible()
        
        applicationCoordinator?.start()
        
        return true
    }
    
    private func lastCoordinator(of coordinator: CoordinatorProtocol) -> CoordinatorProtocol {
        guard let nextCoordinator = coordinator.childCoordinator else { return coordinator }
        return lastCoordinator(of: nextCoordinator)
    }
}

extension AppDelegate {
    /// Since we don't control creation of our AppDelegate, we have to use "property injection" to populate
    /// our required properties
    func injectProperties(_ window: UIWindow, applicationCoordinator: ApplicationCoordinator) {
        self.window = window
        self.applicationCoordinator = applicationCoordinator
        print(applicationCoordinator)
    }
}

