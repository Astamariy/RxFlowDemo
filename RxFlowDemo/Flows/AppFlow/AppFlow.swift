//
//  AppFlow.swift
//  RxFlowDemo
//
//  Created by Рузманов Александр Юрьевич on 06.04.2020.
//  Copyright © 2020 Рузманов Александр Юрьевич. All rights reserved.
//

import RxFlow
import Swinject
import UIKit

final class AppFlow: Flow {
    
    // MARK: - Public properties
    
    var root: Presentable {
        return self.rootViewController
    }
    
    private var assembler: Assembler!
    
    private let container: Container
    
    private let rootViewController: UIViewController
    
    // MARK: - Initialization
    
    init(container: Container) {
        self.rootViewController = UIViewController()
        self.container = container
        initAssembler()
    }
    
    // MARK: - Public methods
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppFlowStep else { return .none }
        switch step {
        case .pets:
            return navigationToPets()
        }
    }
    
    // MARK: - Private methods
    
    private func initAssembler() {
        assembler = Assembler([PetFlowAssembly()], container: container)
    }
    
    private func navigationToPets() -> FlowContributors {
        let petFlow = assembler.resolver.resolve(PetFlow.self)!
        Flows.whenReady(flow1: petFlow) { [unowned self] root in
            self.rootViewController.present(root, animated: true, completion: nil)
        }
        let petStepper = assembler.resolver.resolve(PetFlowStepper.self)!
        return .one(
            flowContributor: .contribute(
                withNextPresentable: petFlow,
                withNextStepper: petStepper,
                allowStepWhenNotPresented: false
            )
        )
    }
    
}
