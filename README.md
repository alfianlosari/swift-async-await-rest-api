# Using Swift 5.5 Async Await to Fetch REST APIs

![Alt text](./promo.jpg?raw=true "Callback vs Async Await")

Source code for Tutorial on experimenting with Swift Async Await to fetch multiple REST API endpoints and eliminate Pyramid of Doom callback hell to improve code readability and maintanability. I will introduce Structured Concurrency Task API to execute single and parallel async tasks. Finally, we'll use Continuation API to interface current synchronous code with callback to async function.

## Article
Article link at https://www.alfianlosari.com/posts/using-swift-5-5-async-await-to-fetch-rest-api/

## Requirement
- Xcode 12.5
- macOS Big Sur
- Swift 5.5 Toolchain - I am using 28/5 development nightly build from this[swift.org link](https://swift.org/builds/swift-5.5-branch/xcode/swift-5.5-DEVELOPMENT-SNAPSHOT-2021-05-28-a/swift-5.5-DEVELOPMENT-SNAPSHOT-2021-05-28-a-osx.pkg)
- Set Swift 5.5 as toolchain in Xcode.

## Getting Started - Backend
- Copy and Clone the project
- Open Starter Folder
- Open async-api.xcodeproj
- Follow the tutorial from the given link above

## Description
In this repo, we will be learning and experimenting Swift Async Await to solve these 2 tasks:
1. Fetch Dependent multiple remote APIs sequentially. In this case, we are going to fetch [IP Address from Ipify](https://api.ipify.org/?format=json), [geo location from FreeGeoIP](https://freegeoip.app/json/125.162.209.116), and [country details from RestCountries.eu](https://restcountries.eu/rest/v2/alpha/ID).
2. Concurrently fetch multiple remote APIs in parallel. In this case, we are going to use [SWAPI](https://www.swapi.tech) to fetch ["Revenge of the Sith"](https://www.swapi.tech/api/films/6) data containing url of characters from the movie. Using these urls, we'll fetch all the characters data in parallel.
 
Here are 2 main topics that we will learn along the way:
1. Task Based API introduced in [Structured Concurrency proposal (SE-0304)](https://github.com/apple/swift-evolution/blob/main/proposals/0304-structured-concurrency.md) as the basic unit of concurrency in async function. We'll be learning on how to create single task and task group async functions.
2. Interfacing current synchronous code with completion handler callback to async tasks using [Continuation API introduced in SE-0300](https://github.com/apple/swift-evolution/blob/main/proposals/0300-continuation.md). We'll be interfacing current URLSession data task callback based API to Async Await function.

> Swift 5.5 is currently in development as this article is written, i am using Xcode 12.5 with Swift Nightly 5/29  Development Snapshot from [Swift.org](https://swift.org/builds/swift-5.5-branch/xcode/swift-5.5-DEVELOPMENT-SNAPSHOT-2021-05-28-a/swift-5.5-DEVELOPMENT-SNAPSHOT-2021-05-28-a-osx.pkg). There might be an API changes that break the current code when Swift 5.5 stable is released in the future.
