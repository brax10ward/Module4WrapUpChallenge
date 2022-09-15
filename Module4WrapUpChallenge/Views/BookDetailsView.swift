//
//  BookDetailsView.swift
//  Module4WrapUpChallenge
//
//  Created by Braxton Ward on 9/14/22.
//

import SwiftUI

struct BookDetailsView: View {
    var book:Book
    @EnvironmentObject var model:BookModel
    @State private var rating = 1
    
    var body: some View {
        VStack(spacing: 20.0) {
            NavigationLink {
                BookContentView(book: book)
            } label: {
                VStack {
                    Text("Read Now!")
                        .font(.title2)
                        .foregroundColor(.black)
                    Image("cover\(book.id)")
                        .resizable()
                        .scaledToFit()
                }
            }
            
            Text("Mark for later!")
            Button(action: { model.toggleBookIsFavourite(bookId: book.id) }){
                Image(systemName: book.isFavourite ? "star.fill" : "star")
                    .accentColor(.yellow)
            }
            
            Spacer()
            
            Text("Rate " + book.title)
                .font(.headline)
            
            Picker("", selection: $rating) {
                ForEach(1..<6) { index in
                    Text(String(index)).tag(index)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal, 60)
            .padding(.bottom, 60)
            .onChange(of: rating, perform: { value in
                model.setBookRating(bookId: book.id, rating: rating)
            })
        }
        .onAppear(perform: { rating = book.rating })
        .navigationBarTitle(String(book.title))
    }
}

struct BookDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let model = BookModel()
        let testBook = Book(id: 1, author: "Author", title: "Title", isFavourite: true, currentPage: 0, rating: 0, content: ["1","2"])
        BookDetailsView(book: model.books.first ?? testBook)
    }
}
