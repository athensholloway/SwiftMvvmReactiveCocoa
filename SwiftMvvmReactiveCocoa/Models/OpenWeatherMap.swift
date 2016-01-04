//
//  OpenWeatherMap.swift
//  SwiftMvvmReactiveCocoa
//
//  Created by Athens Holloway on 1/3/16.
//  Copyright © 2016 Logic Artisan, Inc. All rights reserved.
// http://home.openweathermap.org

import Foundation

struct OpenWeatherMap {
    private static let apiKey = "8f7f4f3ef1819c844727254eadc74f0e"
    
    private static let cityIds = [
        6077243, 524901, 5368361, 1835848, 3128760, 4180439,
        2147714, 264371, 1816670, 2643743, 3451190, 1850147
    ]
    
    static let url = "http://api.openweathermap.org/data/2.5/group"
    
    static var parameters: [String: String] {
        return [
            "APPID": apiKey,
            "id": cityIds.map { String($0) }.joinWithSeparator(",")
        ]
    }
}