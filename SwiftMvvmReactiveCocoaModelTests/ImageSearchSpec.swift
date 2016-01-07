import Quick
import Nimble
import ReactiveCocoa
@testable import SwiftMvvmReactiveCocoaModel

class ImageSearchSpec: QuickSpec {
    // MARK: Stub
    class GoodStubNetwork: Networking {
        func requestJSON(url: String, parameters: [String : AnyObject]?)
            -> SignalProducer<AnyObject, NetworkError>
        {
            var imageJSON0 = imageJSON
            imageJSON0["id"] = 0
            var imageJSON1 = imageJSON
            imageJSON1["id"] = 1
            let json: [String: AnyObject] = [
                "totalHits": 123,
                "hits": [imageJSON0, imageJSON1]
            ]
            
            return SignalProducer { observer, disposable in
                observer.sendNext(json)
                observer.sendCompleted()
                }.observeOn(QueueScheduler())
        }
    }
    
    class BadStubNetwork: Networking {
        func requestJSON(url: String, parameters: [String : AnyObject]?)
            -> SignalProducer<AnyObject, NetworkError>
        {
            let json = [String: AnyObject]()
            
            return SignalProducer { observer, disposable in
                observer.sendNext(json)
                observer.sendCompleted()
                }.observeOn(QueueScheduler())
        }
    }
    
    class ErrorStubNetwork: Networking {
        func requestJSON(url: String, parameters: [String : AnyObject]?)
            -> SignalProducer<AnyObject, NetworkError>
        {
            return SignalProducer { observer, disposable in
                observer.sendFailed(.NotConnectedToInternet)
                }.observeOn(QueueScheduler())
        }
    }
    
    // MARK: - Spec
    override func spec() {
        it("returns images if the network works correctly.") {
            var response: ResponseEntity? = nil
            let search = ImageSearch(network: GoodStubNetwork())
            search.searchImages()
                .on(next: { response = $0 })
                .start()
            
            expect(response).toEventuallyNot(beNil())
            expect(response?.totalCount).toEventually(equal(123))
            expect(response?.images.count).toEventually(equal(2))
            expect(response?.images[0].id).toEventually(equal(0))
            expect(response?.images[1].id).toEventually(equal(1))
        }
        it("sends an error if the network returns incorrect data.") {
            var error: NetworkError? = nil
            let search = ImageSearch(network: BadStubNetwork())
            search.searchImages()
                .on(failed: { error = $0 })
                .start()
            
            expect(error).toEventually(equal(NetworkError.IncorrectDataReturned))
        }
        it("passes the error sent by the network.") {
            var error: NetworkError? = nil
            let search = ImageSearch(network: ErrorStubNetwork())
            search.searchImages()
                .on(failed: { error = $0 })
                .start()
            
            expect(error).toEventually(equal(NetworkError.NotConnectedToInternet))
        }
    }
}