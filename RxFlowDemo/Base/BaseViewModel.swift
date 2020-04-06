//
//  BaseViewModel.swift
//  RxFlowDemo
//
//  Created by Рузманов Александр Юрьевич on 06.04.2020.
//  Copyright © 2020 Рузманов Александр Юрьевич. All rights reserved.
//

import RxRelay
import RxFlow

class BaseViewModel: BaseViewModelProtocol {
    var steps = PublishRelay<Step>()
}
