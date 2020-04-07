//
//  PetServicePart.swift
//  RxFlowDemo
//
//  Created by Рузманов Александр Юрьевич on 07.04.2020.
//  Copyright © 2020 Рузманов Александр Юрьевич. All rights reserved.
//

import DITranquillity

final class PetServicePart: DIPart {
    
    static func load(container: DIContainer) {
        container
            .register { PetService() }
            .as(PetServiceProtocol.self)
            .lifetime(.single)
    }
    
}
