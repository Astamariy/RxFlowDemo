//
//  PetListViewController.swift
//  RxFlowDemo
//
//  Created by Рузманов Александр Юрьевич on 06.04.2020.
//  Copyright © 2020 Рузманов Александр Юрьевич. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PetListViewController: BaseViewController {
    
    // MARK: - Private properties
    
    private let disposeBag = DisposeBag()
    
    // MARK: - Outlets

    @IBOutlet weak private var tableView: UITableView! {
        didSet {
            tableView.estimatedRowHeight = UITableView.automaticDimension
            tableView.register(
                UINib(nibName: "PetTableViewCell", bundle: Bundle.main),
                forCellReuseIdentifier: "PetTableViewCell"
            )
        }
    }
    
    // MARK: - Public properties
    
    var viewModel: PetListViewModelProtocol!
    
    // MARK: - Initialization
    
    init(viewModel: PetListViewModelProtocol) {
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
        viewModel.petList
            .asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: "PetTableViewCell")) { _, pet, cell in
                (cell as? PetTableViewCell)?.update(with: pet.name)
        }
        .disposed(by: disposeBag)
        
        tableView.rx
            .modelSelected(Pet.self)
            .bind(to: viewModel.selectedPet)
            .disposed(by: disposeBag)
        
        tableView.rx
            .itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                self?.tableView.deselectRow(at: indexPath, animated: true)
            })
            .disposed(by: disposeBag)
        
        title = viewModel.title
    }

}
