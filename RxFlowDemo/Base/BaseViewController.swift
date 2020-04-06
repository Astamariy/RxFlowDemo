//
//  BaseViewController.swift
//  RxFlowDemo
//
//  Created by Рузманов Александр Юрьевич on 06.04.2020.
//  Copyright © 2020 Рузманов Александр Юрьевич. All rights reserved.
//

import UIKit
import RxFlow

class BaseViewController: UIViewController {
    
    // MARK: - Private properties
    
    private var viewModel: BaseViewModelProtocol!
    
    // MARK: - Public properties
    
    var stepper: Stepper {
        viewModel
    }
    
    // MARK: - Initialization
    
    init(viewModel: BaseViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: Self.self), bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
