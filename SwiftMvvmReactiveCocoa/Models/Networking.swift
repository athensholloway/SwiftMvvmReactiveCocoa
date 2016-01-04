//
//  Networking.swift
//  SwiftMvvmReactiveCocoa
//
//  Created by Athens Holloway on 1/3/16.
//  Copyright © 2016 Logic Artisan, Inc. All rights reserved.
//

import Foundation

protocol Networking {
    func request(response: NSData? -> ())
}