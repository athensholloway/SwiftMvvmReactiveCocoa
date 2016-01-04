//
//  WeatherTableViewControllerSpec.swift
//  SwiftMvvmReactiveCocoa
//
//  Created by Athens Holloway on 1/3/16.
//  Copyright © 2016 Logic Artisan, Inc. All rights reserved.
//
// blog post: https://yoichitgy.github.io/post/dependency-injection-framework-for-swift-simple-weather-app-example-with-swinject-part-2/

import Quick
import Nimble
import Swinject
@testable import SwiftMvvmReactiveCocoa

class WeatherTableViewControllerSpec: QuickSpec {
    class MockNetwork: Networking {
        var requestCount = 0
        
        func request(response: NSData? -> ()) {
            requestCount++
        }
    }
    
    override func spec() {
        var container: Container!
        beforeEach {
            container = Container()
            container.register(Networking.self) { _ in MockNetwork() }
                .inObjectScope(.Container)
            /*
                By setting the object scope, it is ensured that the instance of MockNetwork
                to check the counter is identical to the instance indirectly owned by WeatherTableViewController.
            */

            container.register(WeatherFetcher.self) { r in
                WeatherFetcher(networking: r.resolve(Networking.self)!)
            }
            container.register(WeatherTableViewController.self) { r in
                let controller = WeatherTableViewController()
                controller.weatherFetcher = r.resolve(WeatherFetcher.self)
                return controller
            }
        }
        
        it("starts fetching weather information when the view is about appearing.") {
            let network = container.resolve(Networking.self) as! MockNetwork
            let controller = container.resolve(WeatherTableViewController.self)!
            
            expect(network.requestCount) == 0
            controller.viewWillAppear(true)
            expect(network.requestCount).toEventually(equal(1))
        }
    }
}
