//
//  PetDetailAssembly.swift
//  RxFlowDemo
//
//  Created by Рузманов Александр Юрьевич on 07.04.2020.
//  Copyright © 2020 Рузманов Александр Юрьевич. All rights reserved.
//

import Swinject

final class PetDetailAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(PetDetailViewController.self) { (resolver, petId: Int) in
            let viewModel = resolver.resolve(PetDetailViewModelProtocol.self, argument: petId)!
            let viewController = PetDetailViewController(viewModel: viewModel)
            return viewController
        }
        .implements(BaseViewController.self, name: String(describing: PetDetailViewController.self))
        .inObjectScope(.transient)
        
        container.register(PetDetailViewModelProtocol.self) { (resolver, petId: Int) in
            let petService = resolver.resolve(PetServiceProtocol.self)!
            let viewModel = PetDetailViewModel(petService: petService, petId: petId)
            return viewModel
        }
    }
    
}
