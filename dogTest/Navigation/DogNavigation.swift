//
//  DogNavigation.swift
//  dogTest
//
//  Created by Carlos Jimenez on 08-02-18.
//  Copyright © 2018 Carlos Jimenez. All rights reserved.
//


import UIKit

//
// MARK: Modules of navigations
//
enum NavAvailable: Navigation {
    case listBreeds
    case detailBreed(String)
    
    var navIdentifier: String {
        switch self {
        case .listBreeds:
            return "ListBreeds"
        case .detailBreed:
            return "DetailBreed"
        }
    }
}

//
// MARK: Callbacks
//
class DogNavigation: AppNavigation {

    typealias CallbackAction = (String) -> ()
    
    lazy var breedSelectedAction: CallbackAction = { [unowned self] (breed) in
        UIApplication.topViewController()?.navigate(NavAvailable.detailBreed(breed))
    }
}

//
// MARK: Navigation of modules
//
extension DogNavigation{
    
    public func viewcontrollerForNavigation(navigation: Navigation) -> UIViewController {
        if let navigation = navigation as? NavAvailable {
            switch navigation {
            case .listBreeds:
                let breedsListCoordinator = BreedsListCoordinator(callback: breedSelectedAction)
                let vc = breedsListCoordinator.rootViewController()
                return vc
            case .detailBreed(let breed):
                let breedImageCoordinator = BreedImagesCoordinator()
                breedImageCoordinator.breedName = breed
                let vc = breedImageCoordinator.rootViewController()
                return vc
            }
            
        }
        return UIViewController()
    }
    
    func navigate(_ navigation: Navigation, from: UIViewController, to: UIViewController) {
        from.navigationController?.pushViewController(to, animated: false)
    }
    
    func start(_ navigation: Navigation, from: UIViewController, to: UIViewController) {
        from.present(to, animated: false, completion: nil)
    }
    
    func presenterVC(from: UIViewController, to: UIViewController) {
        from.present(to, animated: false, completion: nil)
    }
    
}

