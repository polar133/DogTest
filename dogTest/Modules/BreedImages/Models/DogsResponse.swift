//
//  DogsResponse.swift
//  dogTest
//
//  Created by Carlos Jimenez on 08-02-18.
//  Copyright © 2018 Carlos Jimenez. All rights reserved.
//

import Foundation
import Unbox

struct DogsResponse: APIResponse {
    var status: String?
    var message : [String]?
}

extension DogsResponse: Equatable {}
func == (lhs: DogsResponse, rhs: DogsResponse) -> Bool {
    return lhs.message ?? [] == rhs.message ?? []
}

extension DogsResponse: Unboxable {
    init(unboxer: Unboxer) throws {
        self.status = unboxer.unbox(key: "status")
        self.message = unboxer.unbox(key: "message")
    }
}
