import Foundation

@main
struct App {
    
    static func main() {
        // Get Current IP Address
        fetchAPI(url: IpifyResponse.url) { (result: Result<IpifyResponse, Error>) in
            
            switch result {
            case .success(let response):
                print(response)
                
                // Get Geolocation data using the IP Address
                fetchAPI(url: FreeGeoIPResponse.url(ipAddress: response.ip)) { (result: Result<FreeGeoIPResponse, Error>) in
                    
                    switch result {
                    case .success(let response):
                        print(response)
                        
                        // Get Country Detail using the geolocation data country code
                        fetchAPI(url: RestCountriesResponse.url(countryCode: response.countryCode)) { (result: Result<RestCountriesResponse, Error>) in
                            switch result {
                            case .success(let response):
                                print(response)
                            case .failure(let error):
                                print(error.localizedDescription)
                            }
                        }
                        
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        RunLoop.main.run(until: .distantFuture)
    }
}
