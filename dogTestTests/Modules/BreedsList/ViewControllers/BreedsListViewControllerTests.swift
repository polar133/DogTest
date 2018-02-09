//
//  BreedsListViewControllerTests.swift
//  dogTestTests
//
//  Created by Carlos Jimenez on 09-02-18.
//  Copyright © 2018 Carlos Jimenez. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Mockingjay

@testable import dogTest

class BreedsListViewControllerTests: QuickSpec {
    
    
    override func spec() {
        
        describe("BreedsListViewController") {
            
            it("should be able to call the function when selecting a breed") {
                let expectation = self.expectation(description: "call selectBreed")
                
                let breedName = "hound"
                let breedsListCoord = BreedsListCoordinator(callback: { (dogselected) -> ()? in
                    expect(dogselected).to(equal(breedName))
                })
                breedsListCoord.selectBreed(name: breedName)
                expectation.fulfill()
                self.waitForExpectations(timeout: 0, handler: nil)
            }
        }
    }
}
