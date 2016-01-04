//
//  CompanyRankingRepository.swift
//  SwiftMvvmReactiveCocoa
//
//  Created by Athens Holloway on 12/30/15.
//  Copyright © 2015 Logic Artisan, Inc. All rights reserved.
// http://blog.scottlogic.com/2015/04/28/reactive-cocoa-3-continued.html
// http://nomothetis.svbtle.com/an-introduction-to-reactivecocoa
// https://yoichitgy.github.io/post/dependency-injection-in-mvvm-architecture-with-reactivecocoa-part-5-asynchronous-image-load/

import Foundation
import ReactiveCocoa
import Alamofire

public class CompanyRankingRepository {
    let serviceUrl = "http://gomashup.com/json.php?fds=finance/fortune500/company/%@&jsoncallback=?"
    
    func getCompanyRankings(company: String) -> SignalProducer<[CompanyRanking], NSError> {
        
        return SignalProducer {observer, disposable in
            //let url = String(format: self.serviceUrl, company)
            let url = "http://jsonplaceholder.typicode.com/users"
            
            print("Company Search Request: \(url)")
/*
            Alamofire.request(.GET, url)
                .responseString { response in
                    //print(response.request)  // original URL request
                    //print(response.response) // URL response
                    //print(response.data)     // server data
                    print(response.result)   // result of response serialization
                    
                    if let JSON = response.result.value {
                        print("JSON: \(JSON)")
                    }
            }
  */
            Alamofire.request(.GET, url)
                .responseCollection { (response: Response<[CompanyRanking], NSError>) in
                    
                    switch response.result {
                        case .Success(let companyRankings):
                            observer.sendNext(companyRankings);
                            observer.sendCompleted()
                    case .Failure(let error):
                            print("Failed to get company rankings: \(error)")
                            observer.sendFailed(error)
                    }
                    
            }

        }
    }
}
