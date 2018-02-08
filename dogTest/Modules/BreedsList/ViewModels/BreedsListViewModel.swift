//
//  BreedsListViewModel.swift
//  dogTest
//
//  Created by Carlos Jimenez on 08-02-18.
//  Copyright © 2018 Carlos Jimenez. All rights reserved.
//

import Foundation
import Alamofire
import UnboxedAlamofire

class BreedsListViewModel {
    
    typealias Breed = String
    
    fileprivate var URL: String { return "https://dog.ceo/api/breeds/list" }
    fileprivate var breeds : [Breed] = []
    
    public let title : String = "Breeds of dogs"
    
    func getHeightRow() -> CGFloat{
        return 70.0
    }
    
    func getBreed(index: Int) -> Breed {
        return breeds[index]
    }
    
    func getBreedsCount() -> Int {
        return breeds.count
    }
    
    // MARK: - Get list of breeds
    func fetchBreedsList(completionHandler: @escaping () -> ()){
        
        Alamofire.request(URL, method: .get).responseObject { [weak self] (response: DataResponse<BreedResponse>) in
            // handle response
            let breedsResponse = response.result.value
            if breedsResponse != nil{
                self?.breeds = breedsResponse?.message ?? []
            }
            
            // handle error
            if let error = response.result.error as? UnboxedAlamofireError {
                print("error: \(error.description)")
            }
            completionHandler()
        }
    }
    
}
