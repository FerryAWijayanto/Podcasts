//
//  Alamofire.swift
//  PodcastsCourseLBTA
//
//  Created by Ferry Adi Wijayanto on 17/08/19.
//  Copyright © 2019 Ferry Adi Wijayanto. All rights reserved.
//

import Alamofire

class APIServices {
    
    private let url = " https://itunes.apple.com/search"
    static let shared = APIServices()
    
    func fetchPodcasts(with searchText: String, completion: @escaping ([Podcast]) -> ()) {
        
        let parameters = ["term": searchText, "media": "podcast"]
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
            if let err = dataResponse.error {
                print("Failed to fetch data:", err)
                return
            }
            
            guard let data = dataResponse.data else { return }
            
            do {
                let searchResults = try JSONDecoder().decode(SearchResults.self, from: data)
                completion(searchResults.results)
                
            } catch let decodeErr {
                print("Failed to decode JSON data:", decodeErr)
            }
        }
        
    }
}
