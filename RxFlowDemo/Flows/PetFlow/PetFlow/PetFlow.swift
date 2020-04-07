//
//  PetFlow.swift
//  RxFlowDemo
//
//  Created by Рузманов Александр Юрьевич on 06.04.2020.
//  Copyright © 2020 Рузманов Александр Юрьевич. All rights reserved.
//

import RxFlow
import DITranquillity

final class PetFlow: Flow {
    
    // MARK: - Public properties
    
    var root: Presentable {
        return self.rootViewController
    }
    
    // MARK: - Private properties
    
    private let container: DIContainer
    
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        viewController.modalPresentationStyle = .fullScreen
        return viewController
    }()
    
    // MARK: - Initialization
    
    init(container: DIContainer) {
        self.container = container
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
    
    private func push(viewController: BaseViewController) -> FlowContributors {
        rootViewController.pushViewController(viewController, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: viewController,
            withNextStepper: viewController.stepper,
            allowStepWhenNotPresented: false
            )
        )
    }
    
    private func petListScreen() -> FlowContributors {
        let viewController: BaseViewController = container.resolve(name: String(describing: PetListViewController.self))
        return push(viewController: viewController)
    }
    
    private func petDetailScreen(with petId: Int) -> FlowContributors {
        let name = String(describing: PetDetailViewController.self)
        container.extensions(for: PetDetailViewModelProtocol.self)?.setArgs(petId)
        let viewController: BaseViewController = container.resolve(name: name)
        return push(viewController: viewController)
    }
    
}
