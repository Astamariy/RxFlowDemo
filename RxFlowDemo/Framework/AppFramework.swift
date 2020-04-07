//
//  AppFramework.swift
//  RxFlowDemo
//
//  Created by Рузманов Александр Юрьевич on 07.04.2020.
//  Copyright © 2020 Рузманов Александр Юрьевич. All rights reserved.
//

import DITranquillity

final class AppFramework: DIFramework {
    
    static func load(container: DIContainer) {
        // MARK: - Services
        container.append(part: PetServicePart.self)
        // MARK: - Flows
        container.append(part: PetFlowPart.self)
        container.append(part: AppFlowPart.self)
        // MARK: - Screens
        container.append(part: PetListPart.self)
        container.append(part: PetDetailPart.self)
    }
    
}

