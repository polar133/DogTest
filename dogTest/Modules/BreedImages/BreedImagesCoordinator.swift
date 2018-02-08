//
//  BreedImagesCoordinator.swift
//  dogTest
//
//  Created by Carlos Jimenez on 08-02-18.
//  Copyright © 2018 Carlos Jimenez. All rights reserved.
//

import Foundation
import UIKit

open class BreedImagesCoordinator {
    
    // MARK: - Properties
    var breedName: String!
    
    // MARK: Private
    fileprivate static let bundle = Bundle(for: BreedImagesCoordinator.self)
    
    // MARK: View Controller's
    fileprivate var navigationController: UINavigationController {
        if _navigationController == nil {
            _navigationController = UINavigationController(rootViewController: self.breedImagesVC)
        }
        return _navigationController!
    }
    private var _navigationController: UINavigationController?
    
    fileprivate var breedImagesVC: BreedImagesViewController {
        if _breedImagesVC == nil {
            let viewModel = BreedImagesViewModel(breedName: breedName)
            let viewController = BreedImagesViewController(viewModel: viewModel)
            _breedImagesVC = viewController
        }
        return _breedImagesVC!
    }
    
    private var _breedImagesVC: BreedImagesViewController?
    
    open func rootViewController() -> UIViewController {
        return breedImagesVC
    }
    
}
