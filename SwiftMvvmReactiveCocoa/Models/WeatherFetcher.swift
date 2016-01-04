//
//  WeatherFetcher.swift
//  SwiftMvvmReactiveCocoa
//
//  Created by Athens Holloway on 1/3/16.
//  Copyright © 2016 Logic Artisan, Inc. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct WeatherFetcher {
    let networking: Networking
    
    func fetch(response: [City]? -> ()) {
        //networking.request { response($0.map {self.decode($0)})}
        
        networking.request {data in
            let cities = data.map {self.decode($0)}
            
            response(cities)
        }
    }
    
    private func decode(data: NSData) -> [City] {
        let json = JSON(data: data)
        var cities = [City]()
        for (_, j) in json["list"] {
            if let id = j["id"].int {
                let city = City(
                    id: id,
                    name: j["name"].string ?? "",
                    weather: j["weather"][0]["main"].string ?? "")
                
                print("city: \(city)")
                cities.append(city)
            }
        }
        return cities
    }
}