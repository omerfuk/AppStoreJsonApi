//
//  SearchResult.swift
//  AppStoreJsonApi
//
//  Created by Ömer Faruk Kılıçaslan on 21.06.2022.
//

import Foundation


struct SearchResult : Codable {
    let resultCount: Int
    let results: [Result]
            
}

struct Result: Codable {
    let trackName: String
    let primaryGenreName: String
}
