//
//  PetListViewModel.swift
//  RxFlowDemo
//
//  Created by Рузманов Александр Юрьевич on 06.04.2020.
//  Copyright © 2020 Рузманов Александр Юрьевич. All rights reserved.
//

import RxRelay
import RxCocoa
import RxSwift
import RxFlow

final class PetListViewModel: BaseViewModel, PetListViewModelProtocol {
    
    // MARK: - Private properties
    
    private let disposeBag = DisposeBag()
    
    // MARK: - Public properties
    
    let selectedPet = PublishRelay<Pet>()
    
    let petList: Driver<[Pet]>
    
    let title = "Choose your pet"
    
    // MARK: - Initialization
    
    init(petService: PetServiceProtocol) {
        let pets = petService.petList()
        self.petList = Driver<[Pet]>.just(pets)
        super.init()
        
        binding()
    }
    
    // MARK: - Private methods
    
    private func binding() {
        selectedPet
            .map { $0.id }
            .subscribe(onNext: { [weak self] id in
                self?.steps.accept(PetFlowStep.petDetail(petId: id))
            })
            .disposed(by: disposeBag)
    }
}
