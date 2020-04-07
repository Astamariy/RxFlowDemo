//
//  AppFlowAssembly.swift
//  RxFlowDemo
//
//  Created by Рузманов Александр Юрьевич on 07.04.2020.
//  Copyright © 2020 Рузманов Александр Юрьевич. All rights reserved.
//

import Swinject

final class AppFlowAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(AppFlow.self) { _ in
            AppFlow(container: container)
        }
        .inObjectScope(.container)
        
        container.register(AppFlowStepper.self) { _ in
            AppFlowStepper()
        }
        .inObjectScope(.container)
    }
    
}
