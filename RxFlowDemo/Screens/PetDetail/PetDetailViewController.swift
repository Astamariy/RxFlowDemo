//
//  PetDetailViewController.swift
//  RxFlowDemo
//
//  Created by Рузманов Александр Юрьевич on 06.04.2020.
//  Copyright © 2020 Рузманов Александр Юрьевич. All rights reserved.
//

import UIKit
import RxSwift

class PetDetailViewController: BaseViewController {
    
    // MARK: - Private properties
    
    private let disposeBag = DisposeBag()
    
    // MARK: - Outlets
    
    @IBOutlet weak private var imageView: UIImageView!
    
    @IBOutlet weak private var nameLabel: UILabel!
    
    // MARK: - Public properties
    
    var viewModel: PetDetailViewModelProtocol!
    
    // MARK: - Initialization
    
    init(viewModel: PetDetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(viewModel: viewModel)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        binding()
    }
    
    // MARK: - Private methods
    
    private func binding() {
        viewModel.pet
            .drive(onNext: { [weak self] pet in
                self?.imageView.image = UIImage(named: pet.imageName)
                self?.title = pet.name
                self?.nameLabel.text = pet.name
            })
            .disposed(by: disposeBag)
    }

}
