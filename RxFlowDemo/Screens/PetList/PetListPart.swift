//
//  PetListPart.swift
//  RxFlowDemo
//
//  Created by Рузманов Александр Юрьевич on 07.04.2020.
//  Copyright © 2020 Рузманов Александр Юрьевич. All rights reserved.
//

import DITranquillity

final class PetListPart: DIPart {
    
    static func load(container: DIContainer) {
        container
            .register { PetListViewController(viewModel: $0) }
            .as(BaseViewController.self, name: String(describing: PetListViewController.self))
            .lifetime(.prototype)
        
        container
            .register { PetListViewModel(petService: $0) }
            .as(PetListViewModelProtocol.self)
            .lifetime(.prototype)
    }
    
}
