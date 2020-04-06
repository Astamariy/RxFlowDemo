//
//  PetDetailViewModel.swift
//  RxFlowDemo
//
//  Created by Рузманов Александр Юрьевич on 06.04.2020.
//  Copyright © 2020 Рузманов Александр Юрьевич. All rights reserved.
//

import RxRelay
import RxCocoa

class PetDetailViewModel: PetDetailViewModelProtocol {
    
    // MARK: - Public properties
    
    var pet: Driver<Pet>
    
    // MARK: - Initialization
    
    init(petService: PetServiceProtocol, petId: Int) {
        let pet = petService.pet(with: petId)!
        self.pet = Driver<Pet>.just(pet)
    }
    
}
