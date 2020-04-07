//
//  PetFlowPart.swift
//  RxFlowDemo
//
//  Created by Рузманов Александр Юрьевич on 07.04.2020.
//  Copyright © 2020 Рузманов Александр Юрьевич. All rights reserved.
//

import DITranquillity

final class PetFlowPart: DIPart {
    
    static func load(container: DIContainer) {
        container
            .register { PetFlow(container: container) }
        
        container
            .register { PetFlowStepper() }
    }
    
}
