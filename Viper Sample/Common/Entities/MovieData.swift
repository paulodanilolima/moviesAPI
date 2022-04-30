//
//  MovieData.swift
//  Viper Sample
//
//  Created by Paulo Danilo Conceição Lima on 16/02/22.
//

import Foundation

struct MovieData: Decodable {
    let page: Int
    let total_pages: Int
    let results:[results]
}

struct results: Decodable {
    let adult: Bool
    let poster_path: String?
    let release_date: String
    let original_title: String
    let overview: String?
}
