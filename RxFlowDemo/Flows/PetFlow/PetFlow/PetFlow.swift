//
//  PetFlow.swift
//  RxFlowDemo
//
//  Created by Рузманов Александр Юрьевич on 06.04.2020.
//  Copyright © 2020 Рузманов Александр Юрьевич. All rights reserved.
//

import RxFlow

final class PetFlow: Flow {
    
    // MARK: - Public properties
    
    var root: Presentable {
        return self.rootViewController
    }
    
    // MARK: - Private properties
    
    private let petService: PetServiceProtocol
    
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        viewController.modalPresentationStyle = .fullScreen
        return viewController
    }()
    
    // MARK: - Initialization
    
    init(petService: PetServiceProtocol) {
        self.petService = petService
    }
    
    // MARK: - Public methods
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? PetFlowStep else { return .none }
        switch step {
        case .petList:
            return petListScreen()
        case .petDetail(let petId):
            return petDetailScreen(with: petId)
        }
    }
    
    // MARK: - Private methods
    
    private func petListScreen() -> FlowContributors {
        let viewController = PetListConfigurator.configure(petService: petService)
        rootViewController.pushViewController(viewController, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: viewController,
            withNextStepper: viewController.stepper,
            allowStepWhenNotPresented: false
            )
        )
    }
    
    private func petDetailScreen(with petId: Int) -> FlowContributors {
        let viewController = PetDetailConfigurator.configure(petService: petService, petId: petId)
        rootViewController.pushViewController(viewController, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: viewController,
            withNextStepper: DefaultStepper(),
            allowStepWhenNotPresented: false
            )
        )
    }
    
}
