//
//  AppFlowCoordinator.swift
//  RxFlowDemo
//
//  Created by Рузманов Александр Юрьевич on 06.04.2020.
//  Copyright © 2020 Рузманов Александр Юрьевич. All rights reserved.
//

import RxSwift
import RxFlow

final class AppFlowCoordinator: AppFlowCoordinatorProtocol {
    
    // MARK: - Private properties
    
    private let disposeBag = DisposeBag()
    
    private let coordinator = FlowCoordinator()
    
    func configure(window: UIWindow) {
        bindCoordinatorLogs()
        coordinateAppFlow(window: window)
    }
    
    // MARK: - Private methods
    
    private func coordinateAppFlow(window: UIWindow) {
        
        let appFlow = AppFlow()
        let appFlowStepper = AppFlowStepper()
        
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
