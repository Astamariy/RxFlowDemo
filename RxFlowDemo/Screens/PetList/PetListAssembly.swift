//
//  PetListAssembly.swift
//  RxFlowDemo
//
//  Created by Рузманов Александр Юрьевич on 07.04.2020.
//  Copyright © 2020 Рузманов Александр Юрьевич. All rights reserved.
//

import Swinject

final class PetListAssembly: Assembly {
    func assemble(container: Container) {
        
        container.register(PetListViewController.self) { resolver in
            let viewModel = resolver.resolve(PetListViewModelProtocol.self)!
            let viewController = PetListViewController(viewModel: viewModel)
            return viewController
        }
        .implements(BaseViewController.self, name: String(describing: PetListViewController.self))
        .inObjectScope(.container)
        
        container.register(PetListViewModelProtocol.self) { resolver in
            let petService = resolver.resolve(PetServiceProtocol.self)!
            let viewModel = PetListViewModel(petService: petService)
            return viewModel
        }
        
    }
    
    
}
