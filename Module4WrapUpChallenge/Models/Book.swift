//
//  Book.swift
//  Module4WrapUpChallenge
//
//  Created by Braxton Ward on 9/14/22.
//

import Foundation

struct Book: Identifiable, Decodable {
    var id: Int
    var author: String
    var title: String
    var isFavourite: Bool
    var currentPage: Int
    var rating: Int
    var content: [String]
}
