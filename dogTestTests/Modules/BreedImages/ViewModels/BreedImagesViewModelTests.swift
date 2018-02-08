//
//  BreedImagesViewModelTests.swift
//  dogTestTests
//
//  Created by Carlos Jimenez on 08-02-18.
//  Copyright © 2018 Carlos Jimenez. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Mockingjay

@testable import dogTest

class BreedImagesViewModelTests: QuickSpec {
    override func spec() {
        
        describe("BreedImagesViewModelTests") {
            let body = ["status": "success","message": ["https://dog.ceo/api/img/hound-Ibizan/n02091244_100.jpg"]] as [String : Any]
            
            context("Trying to GET request") {
                beforeEach {
                    self.stub(http(.get, uri: "https://dog.ceo/api/breed/hound/images"), delay: nil, json(body))
                }
                
                it("should be able to start a request from a given Service") {
                    let viewModel = BreedImagesViewModel(breedName: "hound")
                    viewModel.fetchDogsList(completionHandler: {
                        expect(viewModel.getDogsCount()).to(equal(1))
                        expect(viewModel.getDog(index: 0)).to(equal("https://dog.ceo/api/img/hound-Ibizan/n02091244_100.jpg"))
                    })
                }
            }
            
            context("Trying to GET request error") {
                beforeEach {
                    let serverErrorStub = http(500, headers: nil, download: .noContent)
                    self.stub(http(.get, uri: "https://dog.ceo/api/breed/hound/images"), delay: nil, serverErrorStub)
                    
                }
                
                it("should fail the request") {
                    
                    let viewModel = BreedImagesViewModel(breedName: "hound")
                    viewModel.fetchDogsList(completionHandler: {
                        expect(viewModel.getDogsCount()).to(equal(0))
                    })
                }
                
            }
            
        }
    }
}
