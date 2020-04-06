//
//  AppDelegate.swift
//  RxFlowDemo
//
//  Created by Рузманов Александр Юрьевич on 06.04.2020.
//  Copyright © 2020 Рузманов Александр Юрьевич. All rights reserved.
//

import UIKit
import RxSwift
import RxFlow


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - Private properties
    private let coordinator: AppFlowCoordinatorProtocol = AppFlowCoordinator()
    
    // MARK: - Public properties
    
    var window: UIWindow?
    
    // MARK: - Public methods

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        guard let window = window else { return false }
        coordinator.configure(window: window)
        return true
    }

}

