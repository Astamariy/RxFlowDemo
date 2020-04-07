//
//  PetDetailPart.swift
//  RxFlowDemo
//
//  Created by Рузманов Александр Юрьевич on 07.04.2020.
//  Copyright © 2020 Рузманов Александр Юрьевич. All rights reserved.
//

import DITranquillity

final class PetDetailPart: DIPart {
    
    static func load(container: DIContainer) {
        container
            .register { PetDetailViewController(viewModel: $0) }
            .as(BaseViewController.self, name: String(describing: PetDetailViewController.self))
            .lifetime(.prototype)
        
        container
            .register { PetDetailViewModel(petService: $0, petId: arg($1)) }
            .as(PetDetailViewModelProtocol.self)
            .lifetime(.prototype)
    }
    
}
