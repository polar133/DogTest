//
//  BreedsListViewModelTests.swift
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

class BreedsListViewModelTests: QuickSpec {
    override func spec() {
        
        describe("BreedsListViewModel") {
            let body = ["status": "success","message": ["affenpinscher"]] as [String : Any]
            
            
            
            context("Trying to GET request") {
                beforeEach {
                    self.stub(http(.get, uri: "https://dog.ceo/api/breeds/list"), delay: nil, json(body))
                }
                
                it("should be able to start a request from a given Service") {
                    let viewModel = BreedsListViewModel()
                    viewModel.fetchBreedsList(completionHandler: {})
                    expect(viewModel.getBreedsCount()).toEventually(equal(1))
                    expect(viewModel.getBreed(index: 0)).toEventually(equal("affenpinscher"))
                }
            }
            context("Trying to GET request error") {
                beforeEach {
                    let serverErrorStub = http(500, headers: nil, download: .noContent)
                    self.stub(http(.get, uri: "https://dog.ceo/api/breeds/list"), delay: nil, serverErrorStub)
                    
                }
                
                it("should fail the request") {
                    
                    let viewModel = BreedsListViewModel()
                    viewModel.fetchBreedsList(completionHandler: {
                        expect(viewModel.getBreedsCount()).to(equal(0))
                    })
                }
                
            }
            
        }
    }
}
