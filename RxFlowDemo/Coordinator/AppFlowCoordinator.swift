//
//  AppFlowCoordinator.swift
//  RxFlowDemo
//
//  Created by Рузманов Александр Юрьевич on 06.04.2020.
//  Copyright © 2020 Рузманов Александр Юрьевич. All rights reserved.
//

import RxSwift
import RxFlow
import DITranquillity

final class AppFlowCoordinator: AppFlowCoordinatorProtocol {
    
    // MARK: - Private properties
    
    private let disposeBag = DisposeBag()
    
    private let coordinator = FlowCoordinator()
    
    private let container: DIContainer
    
    func configure(window: UIWindow) {
        bindCoordinatorLogs()
        coordinateAppFlow(window: window)
    }
    
    // MARK: - Initialization
    
    init(container: DIContainer) {
        self.container = container
        initFramework()
    }
    
    // MARK: - Private methods
    
    private func initFramework() {
        container.append(framework: AppFramework.self)
        #if DEBUG
          if !container.validate() {
            fatalError("you has errors")
          }
        #endif
        container.initializeSingletonObjects()
    }
    
    private func coordinateAppFlow(window: UIWindow) {
        let appFlow: AppFlow = container.resolve()
        let appFlowStepper: AppFlowStepper = container.resolve()
        
        Flows.whenReady(flow1: appFlow) { root in
            window.rootViewController = root
            window.makeKeyAndVisible()
        }
        
        self.coordinator.coordinate(flow: appFlow, with: appFlowStepper)
    }
    
    private func bindCoordinatorLogs() {
        coordinator.rx
            .willNavigate
            .subscribe(onNext: { (flow, step) in
                print("will navigate to flow=\(flow) and step=\(step)")
            })
            .disposed(by: self.disposeBag)

        coordinator.rx
            .didNavigate
            .subscribe(onNext: { (flow, step) in
                print("did navigate to flow=\(flow) and step=\(step)")
            })
            .disposed(by: self.disposeBag)
    }
}
