//
//  DogNavigation.swift
//  dogTest
//
//  Created by Carlos Jimenez on 08-02-18.
//  Copyright © 2018 Carlos Jimenez. All rights reserved.
//


import UIKit

enum NavAvailable: Navigation {
    case listBreeds
    case detailBreed
    
    var navIdentifier: String {
        switch self {
        case .listBreeds:
            return "ListBreeds"
        case .detailBreed:
            return "DetailBreed"
        }
    }
}

class DogNavigation: AppNavigation {
    
    typealias CallbackAction = () -> ()
    typealias CallbackNavAction = (String) -> ()
    
    
}

extension DogNavigation{
    
    public func viewcontrollerForNavigation(navigation: Navigation) -> UIViewController {
        if let navigation = navigation as? NavAvailable {
            switch navigation {
            case .listBreeds:
                let breedsListCoordinator = BreedsListCoordinator()
                let vc = breedsListCoordinator.rootViewController()
                return vc
                
            default:
                return UIViewController()
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

