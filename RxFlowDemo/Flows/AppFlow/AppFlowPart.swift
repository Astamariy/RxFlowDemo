//
//  AppFlowPart.swift
//  RxFlowDemo
//
//  Created by Рузманов Александр Юрьевич on 07.04.2020.
//  Copyright © 2020 Рузманов Александр Юрьевич. All rights reserved.
//

import DITranquillity

final class AppFlowPart: DIPart {
    
    static func load(container: DIContainer) {
        container
            .register { AppFlow(container: container) }
            .lifetime(.perContainer(.strong))
        
        container
            .register { AppFlowStepper() }
            .lifetime(.perContainer(.strong))
    }
    
}
