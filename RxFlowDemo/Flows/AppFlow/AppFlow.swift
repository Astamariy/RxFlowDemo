//
//  AppFlow.swift
//  RxFlowDemo
//
//  Created by Рузманов Александр Юрьевич on 06.04.2020.
//  Copyright © 2020 Рузманов Александр Юрьевич. All rights reserved.
//

import RxFlow
import UIKit

final class AppFlow: Flow {
    
    // MARK: - Public properties
    
    var root: Presentable {
        return self.rootViewController
    }
    
    private let rootViewController: UIViewController
    
    // MARK: - Initialization
    
    init() {
        self.rootViewController = UIViewController()
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
        let petService = PetService()
        let petFlow = PetFlow(petService: petService)
        Flows.whenReady(flow1: petFlow) { [unowned self] root in
            self.rootViewController.present(root, animated: true, completion: nil)
        }
        let petStepper = PetFlowStepper()
        return .one(
            flowContributor: .contribute(
                withNextPresentable: petFlow,
                withNextStepper: petStepper,
                allowStepWhenNotPresented: false
            )
        )
    }
    
}
