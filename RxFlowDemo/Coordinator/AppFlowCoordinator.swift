//
//  AppFlowCoordinator.swift
//  RxFlowDemo
//
//  Created by Рузманов Александр Юрьевич on 06.04.2020.
//  Copyright © 2020 Рузманов Александр Юрьевич. All rights reserved.
//

import RxSwift
import RxFlow
import Swinject

final class AppFlowCoordinator: AppFlowCoordinatorProtocol {
    
    // MARK: - Private properties
    
    private let disposeBag = DisposeBag()
    
    private let coordinator = FlowCoordinator()
    
    private var assembler: Assembler!
    
    private let container: Container
    
    func configure(window: UIWindow) {
        bindCoordinatorLogs()
        coordinateAppFlow(window: window)
    }
    
    // MARK: - Initialization
    
    init(container: Container) {
        self.container = container
        initAssembler()
    }
    
    // MARK: - Private methods
    
    private func initAssembler() {
        assembler = Assembler([AppFlowAssembly()], container: container)
    }
    
    private func coordinateAppFlow(window: UIWindow) {
        let appFlow = assembler.resolver.resolve(AppFlow.self)!
        let appFlowStepper = assembler.resolver.resolve(AppFlowStepper.self)!
        
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
