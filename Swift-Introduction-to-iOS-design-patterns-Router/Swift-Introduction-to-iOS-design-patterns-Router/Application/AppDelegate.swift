//
//  AppDelegate.swift
//  Swift-Introduction-to-iOS-design-patterns-Router
//
//  Created by kazunori.aoki on 2021/10/13.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool
    {
        let searchUserViewController = UIStoryboard(name: "SearchUser", bundle: nil)
            .instantiateInitialViewController() as! SearchUserViewController
        let navigationController = UINavigationController(rootViewController: searchUserViewController)
        
        let model = SearchUserModel()
        let router = SearchUserRouter(view: searchUserViewController)
        let presenter = SearchUserPresenter(view: searchUserViewController, model: model, router: router)
        searchUserViewController.inject(presenter: presenter)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}

