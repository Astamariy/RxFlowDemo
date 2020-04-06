//
//  PetTableViewCell.swift
//  RxFlowDemo
//
//  Created by Рузманов Александр Юрьевич on 06.04.2020.
//  Copyright © 2020 Рузманов Александр Юрьевич. All rights reserved.
//

import UIKit

class PetTableViewCell: UITableViewCell {
    
    // MARK: - Outlets

    @IBOutlet private weak var nameLabel: UILabel!
    
    // MARK: - Public methods
    
    func update(with name: String) {
        nameLabel.text = name
    }
    
}
