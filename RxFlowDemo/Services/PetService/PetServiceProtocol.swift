//
//  PetServiceProtocol.swift
//  RxFlowDemo
//
//  Created by Рузманов Александр Юрьевич on 06.04.2020.
//  Copyright © 2020 Рузманов Александр Юрьевич. All rights reserved.
//

import Foundation

protocol PetServiceProtocol {
    func petList() -> [Pet]
    func pet(with id: Int) -> Pet?
}
