//
//  BookModel.swift
//  Module4WrapUpChallenge
//
//  Created by Braxton Ward on 9/14/22.
//

import Foundation

class BookModel: ObservableObject {
    @Published var books = [Book]()
    
    init() {
        self.books = DataService.getLocalData()
    }
    
    func setBookRating(bookId: Int, rating: Int) {
        if let index = self.books.firstIndex(where: {$0.id == bookId}) {
            books[index].rating = rating
        }
    }
    
    func toggleBookIsFavourite(bookId: Int) {
        if let index = self.books.firstIndex(where: {$0.id == bookId}) {
            books[index].isFavourite.toggle()
        }
    }
    
    func updatePage(bookId: Int, page: Int) {
        if let index = books.firstIndex(where: { $0.id == bookId }) {
            books[index].currentPage = page
        }
    }
}
