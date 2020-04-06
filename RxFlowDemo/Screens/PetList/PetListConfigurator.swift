//
//  PetListConfigurator.swift
//  RxFlowDemo
//
//  Created by Рузманов Александр Юрьевич on 06.04.2020.
//  Copyright © 2020 Рузманов Александр Юрьевич. All rights reserved.
//

import Foundation

final class PetListConfigurator {
    
    // MARK: - Configuration
    
    static func configure(petService: PetServiceProtocol) -> BaseViewController {
        let viewModel = PetListViewModel(petService: petService)
        let viewController = PetListViewController(viewModel: viewModel)
        return viewController
    }
    
}
