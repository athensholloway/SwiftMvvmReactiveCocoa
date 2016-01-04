//
//  Network.swift
//  SwiftMvvmReactiveCocoa
//
//  Created by Athens Holloway on 1/3/16.
//  Copyright © 2016 Logic Artisan, Inc. All rights reserved.
//

import Foundation
import Alamofire

struct Network : Networking {
    func request(response: NSData? -> ()) {
        Alamofire.request(.GET, OpenWeatherMap.url, parameters: OpenWeatherMap.parameters)
            .response { _, _, data, _ in
                response(data)
        }
    }
}
