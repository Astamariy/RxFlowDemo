//
//  PetListViewModelProtocol.swift
//  RxFlowDemo
//
//  Created by Рузманов Александр Юрьевич on 06.04.2020.
//  Copyright © 2020 Рузманов Александр Юрьевич. All rights reserved.
//

import RxRelay
import RxFlow
import RxCocoa

protocol PetListViewModelProtocol: BaseViewModelProtocol {
    var selectedPet: PublishRelay<Pet> { get }
    var petList: Driver<[Pet]> { get }
    var title: String { get }
}
