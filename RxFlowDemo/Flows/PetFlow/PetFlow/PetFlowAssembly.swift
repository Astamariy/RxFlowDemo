//
//  PetFlowAssembly.swift
//  RxFlowDemo
//
//  Created by Рузманов Александр Юрьевич on 07.04.2020.
//  Copyright © 2020 Рузманов Александр Юрьевич. All rights reserved.
//

import Swinject

final class PetFlowAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(PetFlow.self) { _ in
            PetFlow(container: container)
        }
        
        container.register(PetFlowStepper.self) { _ in
            PetFlowStepper()
        }
    }
    
}
