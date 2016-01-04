//
//  SearchViewModel.swift
//  SwiftMvvmReactiveCocoa
//
//  Created by Athens Holloway on 12/30/15.
//  Copyright © 2015 Logic Artisan, Inc. All rights reserved.
//

import Foundation
import ReactiveCocoa

public class SearchViewModel {
    
    let companyName = MutableProperty<String>("")
    let repository = CompanyRankingRepository()
    
    /*
    let searchSignal = Signal<Void, NoError>({observer in
        
    })*/
    
    func search(company: String) {
        repository.getCompanyRankings(company)
            .startWithNext({companyRankings in
                print("Company Rankings: \(companyRankings)")
            })
    }
    
    
}