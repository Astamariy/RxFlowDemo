//
//  PetService.swift
//  RxFlowDemo
//
//  Created by Рузманов Александр Юрьевич on 06.04.2020.
//  Copyright © 2020 Рузманов Александр Юрьевич. All rights reserved.
//

import Foundation

final class PetService: PetServiceProtocol {
    
    private let pets: [Pet] = [
        Pet(id: 0, name: "Cat", imageName: "cat"),
        Pet(id: 1, name: "Dog", imageName: "dog"),
        Pet(id: 2, name: "Hamster", imageName: "hamster"),
        Pet(id: 3, name: "Parrot", imageName: "parrot"),
        Pet(id: 4, name: "Whale", imageName: "whale")
    ]
    
    func petList() -> [Pet] {
        pets
    }
    
    func pet(with id: Int) -> Pet? {
        pets.first(where: { $0.id == id })
    }
    
}
