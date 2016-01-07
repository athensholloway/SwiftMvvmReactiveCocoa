//
//  SearchViewController
//  SwiftMvvmReactiveCocoa
//
//  Created by Athens Holloway on 12/30/15.
//  Copyright © 2015 Logic Artisan, Inc. All rights reserved.
//

import UIKit
import ReactiveCocoa
import Himotoki

class SearchViewController: UIViewController {
    let viewModel = SearchViewModel()
    
    @IBOutlet weak var companyNameTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //viewModel.companyName <~ companyNameTextField.rac_text
        

        
        let companyNamesSignalProducer = companyNameTextField.rac_textSignal()
            .toSignalProducer()
            .map { text in text as! String }
        /*
        let searchResults = companyNamesSignalProducer
            .flatMap(.Latest) { (query: String) -> SignalProducer<(NSData, NSURLResponse), NSError> in
                let URLRequest = self.searchRequestWithEscapedQuery(query)
                return NSURLSession.sharedSession().rac_dataWithRequest(URLRequest)
        }*/
        
        
        companyNamesSignalProducer.startWithNext { company in
            self.viewModel.search(company)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

