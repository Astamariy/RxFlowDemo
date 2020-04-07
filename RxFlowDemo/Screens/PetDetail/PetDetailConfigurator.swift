//
//  PetDetailConfigurator.swift
//  RxFlowDemo
//
//  Created by Рузманов Александр Юрьевич on 06.04.2020.
//  Copyright © 2020 Рузманов Александр Юрьевич. All rights reserved.
//

import UIKit

final class PetDetailConfigurator {
    
    // MARK: - Configuration
    
    static func configure(petService: PetServiceProtocol, petId: Int) -> BaseViewController {
        let viewModel = PetDetailViewModel(petService: petService, petId: petId)
        let viewController = PetDetailViewController(viewModel: viewModel)
        return viewController
    }
    
}
