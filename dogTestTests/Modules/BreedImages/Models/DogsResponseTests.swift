//
//  DogsResponseTests.swift
//  dogTestTests
//
//  Created by Carlos Jimenez on 08-02-18.
//  Copyright © 2018 Carlos Jimenez. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Unbox

@testable import dogTest

class DogsResponseTests: QuickSpec {
    
    override func spec() {
        
        describe("DogsResponse") {
            it("should be able to init") {
                let sut : DogsResponse = DogsResponse(status: "test", message: ["response"])
                expect(sut).toNot(beNil())
                expect(sut.status).to(equal("test"))
                expect(sut.message).to(equal(["response"]))
            }
            it("should be able to decode from json") {
                let sut = try! self.item(from: self.mockJSON())
                expect(sut).toNot(beNil())
                expect(sut.status).to(equal("success"))
                expect(sut.message).to(equal(["https://dog.ceo/api/img/hound-Ibizan/n02091244_100.jpg"]))
            }
        }
        
    }
    
    private func item(from dictionary: UnboxableDictionary) throws -> DogsResponse {
        return try unbox(dictionary: dictionary)
    }
    
    private func mockJSON() -> UnboxableDictionary {
        return [
            "status": "success",
            "message": ["https://dog.ceo/api/img/hound-Ibizan/n02091244_100.jpg"]
        ]
    }
    
}
