//
//  City.swift
//  SwiftMvvmReactiveCocoa
//
//  Created by Athens Holloway on 1/3/16.
//  Copyright © 2016 Logic Artisan, Inc. All rights reserved.
//

import Foundation

public struct City: CustomStringConvertible {
    let id: Int
    let name: String
    let weather: String
    
    public var description: String {
        return "(id: \(id), name: \(name), weather: \(weather))"
    }
}
