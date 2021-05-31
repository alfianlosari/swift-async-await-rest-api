import Foundation

@main
struct AsyncApp {
    
    static func main() async {
        await fetchIPGeoCountryAPIs()
        await fetchRevengeOfTheSithCharactersAPI()
    }
    
    static func fetchIPGeoCountryAPIs() async {
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
    
    static func fetchRevengeOfTheSithCharactersAPI() async {
        do {
            // Fetch revenge of the sith movie data containing array of characters ulrs
            let revengeOfSith: SWAPIResponse<Film> = try await fetchAPI(url: Film.url(id: "6"))
            print("Resp: \(revengeOfSith.response)")
            
            // Get first 3 characters and fetch them using TaskGroup in parallel
            let urlsToFetch = Array(revengeOfSith.response.characterURLs.prefix(upTo: 3))
            let revengeOfSithCharacters: [SWAPIResponse<People>] = try await fetchAPIGroup(urls: urlsToFetch)
            print("Resp: \(revengeOfSithCharacters)")
        } catch {
            print(error.localizedDescription)
        }
    }
}
