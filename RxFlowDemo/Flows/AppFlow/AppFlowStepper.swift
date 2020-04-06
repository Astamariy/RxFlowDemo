//
//  AppFlowStepper.swift
//  RxFlowDemo
//
//  Created by Рузманов Александр Юрьевич on 06.04.2020.
//  Copyright © 2020 Рузманов Александр Юрьевич. All rights reserved.
//

import RxFlow
import RxRelay
import RxSwift

final class AppFlowStepper: Stepper {
    
    // MARK: - Public properties
    
    let steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()
    
    var initialStep: Step {
        return RxFlowStep.home
    }
    
    // MARK: - Public methods
    
    func readyToEmitSteps() {
        steps.accept(AppFlowStep.pets)
    }
}
