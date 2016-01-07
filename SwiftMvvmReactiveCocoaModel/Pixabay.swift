internal struct Pixabay {
    internal static let apiURL = "https://pixabay.com/api/"
    
    internal static var requestParameters: [String: AnyObject] {
        return [
            "key": Config.apiKey,
            "image_type": "photo",
            "safesearch": true,
            "per_page": 50,
        ]
    }
}

extension Pixabay {
    private struct Config {
        private static let apiKey = "1840619-a5a47950e6122a98d93714782" // Fill with your own API key.
    }
}