//
//  BreedImagesViewModel.swift
//  dogTest
//
//  Created by Carlos Jimenez on 08-02-18.
//  Copyright © 2018 Carlos Jimenez. All rights reserved.
//

import Foundation
import Alamofire
import UnboxedAlamofire

class BreedImagesViewModel {
    
    typealias Dog = String
    
    fileprivate var breedName: String = ""
    fileprivate var URL: String { return "https://dog.ceo/api/breed/\(breedName)/images" }
    fileprivate var dogs : [Dog] = []
    
    
    init(breedName: String){
        self.breedName = breedName
    }
    
    func getDog(index: Int) -> Dog {
        return dogs[index]
    }
    
    func getDogsCount() -> Int {
        return dogs.count
    }
    
    func fetchDogsList(completionHandler: @escaping () -> ()){
        
        Alamofire.request(URL, method: .get).responseObject { [weak self] (response: DataResponse<DogsResponse>) in
            // handle response
            let dogsResponse = response.result.value
            if dogsResponse != nil{
                self?.dogs = dogsResponse?.message ?? []
            }
            
            // handle error
            if let error = response.result.error as? UnboxedAlamofireError {
                print("error: \(error.description)")
            }
            completionHandler()
        }
    }
    
}
