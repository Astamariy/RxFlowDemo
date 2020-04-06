//
//  PetDetailViewModelProtocol.swift
//  RxFlowDemo
//
//  Created by Рузманов Александр Юрьевич on 06.04.2020.
//  Copyright © 2020 Рузманов Александр Юрьевич. All rights reserved.
//

import RxFlow
import RxCocoa

protocol PetDetailViewModelProtocol {
    var pet: Driver<Pet> { get }
}
