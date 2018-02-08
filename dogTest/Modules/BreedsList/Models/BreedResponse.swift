//
//  BreedResponse.swift
//  dogTest
//
//  Created by Carlos Jimenez on 08-02-18.
//  Copyright © 2018 Carlos Jimenez. All rights reserved.
//

import Foundation
import Unbox

struct BreedResponse: APIResponse {
    var status: String?
    var message : [String]?
}

extension BreedResponse: Equatable {}
func == (lhs: BreedResponse, rhs: BreedResponse) -> Bool {
    return lhs.message ?? [] == rhs.message ?? []
}

extension BreedResponse: Unboxable {
    init(unboxer: Unboxer) throws {
        self.status = unboxer.unbox(key: "status")
        self.message = unboxer.unbox(key: "message")
    }
}
