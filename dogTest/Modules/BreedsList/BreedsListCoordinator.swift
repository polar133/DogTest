//
//  BreedsListCoordinator.swift
//  dogTest
//
//  Created by Carlos Jimenez on 08-02-18.
//  Copyright © 2018 Carlos Jimenez. All rights reserved.
//

import Foundation

import UIKit

open class BreedsListCoordinator {
    
    init(callback: @escaping (String) -> ()?) {
        self.callbackAction = callback
    }
    
    // MARK: - Properties
    var callbackAction: (String) -> ()?
    
    // MARK: Private
    fileprivate static let bundle = Bundle(for: BreedsListCoordinator.self)
    
    // MARK: View Controller's
    fileprivate var navigationController: UINavigationController {
        if _navigationController == nil {
            _navigationController = UINavigationController(rootViewController: self.breedListVC)
        }
        return _navigationController!
    }
    private var _navigationController: UINavigationController?
    
    fileprivate var breedListVC: BreedsListViewController {
        if _breedListVC == nil {
            let viewModel = BreedsListViewModel()
            let viewController = BreedsListViewController(viewModel: viewModel)
            viewController.delegate = self
            _breedListVC = viewController
        }
        return _breedListVC!
    }
    
    private var _breedListVC: BreedsListViewController?
    
    open func rootViewController() -> UIViewController {
        return navigationController
    }
    
}


extension BreedsListCoordinator: BreedListProtocol{
    func  selectBreed(name: String) {
        self.callbackAction(name)
    }
}

