//
//  APIResponse.swift
//  dogTest
//
//  Created by Carlos Jimenez on 08-02-18.
//  Copyright © 2018 Carlos Jimenez. All rights reserved.
//

import Foundation

protocol APIResponse {
    var status : String? { get set }
    var message : [String]? { get set }
}
