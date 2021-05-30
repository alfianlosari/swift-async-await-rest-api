import Foundation

@main
struct App {
    
    static func main() async {
        await fetchIPGeoCountry()
        await fetchSWAPICharactersFromRevengeOfSith()
    }
    
    static func fetchIPGeoCountry() async {
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
    
    static func fetchSWAPICharactersFromRevengeOfSith() async {
        do {
            // Fetch Revenge of Sith Data wtih characters property containing URLs of Character
            let revengeOfSith: SWAPIResponse<Film> = try await fetchAPI(url: Film.url(id: "6"))
            print("Resp: \(revengeOfSith.response)")
            
            // Fetch First 3 Characters given the URLs in Parallel
            let revengeOfSithCharacters: [SWAPIResponse<People>] = try await fetchAPIGroup(urls: Array(revengeOfSith.response.characterURLs.prefix(upTo: 3)))
            print("Resp: \(revengeOfSithCharacters)")
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
