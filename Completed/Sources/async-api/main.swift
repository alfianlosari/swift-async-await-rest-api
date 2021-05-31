import Foundation

@main
struct AsyncApp {
    
    static func main() async {
        do {
            // Get Current IP Address
            let ipifyResponse: IpifyResponse = try await fetchAPI(url: IpifyResponse.url)
            print("Resp: \(ipifyResponse)")
            
            // Get Geolocation data using the IP Address
            let freeGeoIpResponse: FreeGeoIPResponse = try await fetchAPI(url: FreeGeoIPResponse.url(ipAddress: ipifyResponse.ip))
            print("Resp: \(freeGeoIpResponse)")
            
            // Get Country Detail using the geolocation data country code
            let restCountriesResponse: RestCountriesResponse = try await fetchAPI(url: RestCountriesResponse.url(countryCode:  freeGeoIpResponse.countryCode))
            print("Resp: \(restCountriesResponse)")
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
