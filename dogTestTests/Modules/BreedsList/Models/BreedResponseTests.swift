//
//  BreedResponseTests.swift
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

class BreedResponseTests: QuickSpec {
    
    override func spec() {
        
        describe("BreedResponse") {
            it("should be able to init") {
                let sut : BreedResponse = BreedResponse(status: "test", message: ["response"])
                expect(sut).toNot(beNil())
                expect(sut.status).to(equal("test"))
                expect(sut.message).to(equal(["response"]))
            }
            it("should be able to decode from json") {
                let sut = try! self.item(from: self.mockJSON())
                expect(sut).toNot(beNil())
                expect(sut.status).to(equal("success"))
                expect(sut.message).to(equal(["affenpinscher"]))
            }
        }
        
    }
    
    private func item(from dictionary: UnboxableDictionary) throws -> BreedResponse {
        return try unbox(dictionary: dictionary)
    }
    
    private func mockJSON() -> UnboxableDictionary {
        return [
            "status": "success",
            "message": ["affenpinscher"]
        ]
    }
    
}
