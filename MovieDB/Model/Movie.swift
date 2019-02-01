//
//  Movie.swift
//  MovieDB
//
//  Created by Cristian Torres on 1/31/19.
//  Copyright © 2019 Uesebe. All rights reserved.
//

import UIKit

class Results : Codable {
    let page : Int
    let total_results : Int
    let total_pages : Int
    let results: [Result]
    
    init(page : Int, total_results : Int, total_pages : Int, results: [Result]) {
        self.page = page
        self.total_results = total_results
        self.total_pages = total_pages
        self.results = results
    }
}

class Result: Codable {
    let vote_count : Int
    let id : Int
    let video : Bool
    let vote_average : Float
    let title : String
    let popularity : Float
    let poster_path : String
    let original_language : String
    let original_title : String
    let backdrop_path : String
    let adult : Bool
    let overview : String
    let release_date : String
    
    init(vote_count : Int, id : Int, video : Bool, vote_average : Float, title : String, popularity : Float, poster_path : String, original_language : String, original_title : String, backdrop_path : String, adult : Bool, overview : String, release_date : String) {
        self.vote_count = vote_count
        self.id = id
        self.video = video
        self.vote_average = vote_average
        self.title = title
        self.popularity = popularity
        self.poster_path = poster_path
        self.original_language = original_language
        self.original_title = original_title
        self.backdrop_path = backdrop_path
        self.adult = adult
        self.overview = overview
        self.release_date = release_date
    }
}

