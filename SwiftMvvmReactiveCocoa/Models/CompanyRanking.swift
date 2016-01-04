//
//  CompanyRanking.swift
//  SwiftMvvmReactiveCocoa
//
//  Created by Athens Holloway on 12/30/15.
//  Copyright © 2015 Logic Artisan, Inc. All rights reserved.
//

import Foundation

public final class CompanyRanking : ResponseObjectSerializable, ResponseCollectionSerializable,CustomStringConvertible {
    var year: Int
    var rank: Int
    var revenue: Float
    var profit: Float
    var company: String
    
    required public init?(response: NSHTTPURLResponse, representation: AnyObject) {
        self.year = representation.valueForKeyPath("id") as! Int
        self.rank = representation.valueForKeyPath("id") as! Int
        self.revenue = representation.valueForKeyPath("id") as! Float
        self.profit = representation.valueForKeyPath("id") as! Float
        self.company = representation.valueForKeyPath("username") as! String
    }
    
    public static func collection(response response: NSHTTPURLResponse, representation: AnyObject) -> [CompanyRanking] {
        var companyRankings: [CompanyRanking] = []
        
        if let representation = representation as? [[String: AnyObject]] {
            for companyRankingRepresentation in representation {
                if let companyRanking = CompanyRanking(response: response, representation: companyRankingRepresentation) {
                    companyRankings.append(companyRanking)
                }
            }
        }
        
        return companyRankings
    }
    
    public var description: String {
        return "(year: \(year), rank: \(rank), company: \(company))"
    }
}