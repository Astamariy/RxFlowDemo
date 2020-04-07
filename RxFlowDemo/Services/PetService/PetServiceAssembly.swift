//
//  PetServiceAssembly.swift
//  RxFlowDemo
//
//  Created by Рузманов Александр Юрьевич on 07.04.2020.
//  Copyright © 2020 Рузманов Александр Юрьевич. All rights reserved.
//

import Swinject

final class PetServiceAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(PetServiceProtocol.self) { _ in
            PetService()
        }
        .inObjectScope(.container)
    }
    
}
