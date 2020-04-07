//
//  AppFlow.swift
//  RxFlowDemo
//
//  Created by Рузманов Александр Юрьевич on 06.04.2020.
//  Copyright © 2020 Рузманов Александр Юрьевич. All rights reserved.
//

import RxFlow
import DITranquillity
import UIKit

final class AppFlow: Flow {
    
    // MARK: - Public properties
    
    var root: Presentable {
        return self.rootViewController
    }
    
    private let container: DIContainer
    
    private let rootViewController: UIViewController
    
    // MARK: - Initialization
    
    init(container: DIContainer) {
        self.rootViewController = UIViewController()
        self.container = container
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
    
    private func navigationToPets() -> FlowContributors {
        let petFlow: PetFlow = container.resolve()
        Flows.whenReady(flow1: petFlow) { [unowned self] root in
            self.rootViewController.present(root, animated: true, completion: nil)
        }
        let petStepper: PetFlowStepper = container.resolve()
        return .one(
            flowContributor: .contribute(
                withNextPresentable: petFlow,
                withNextStepper: petStepper,
                allowStepWhenNotPresented: false
            )
        )
    }
    
}
