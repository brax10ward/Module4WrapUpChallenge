//
//  BookContentView.swift
//  Module4WrapUpChallenge
//
//  Created by Braxton Ward on 9/15/22.
//

import SwiftUI

struct BookContentView: View {
    var book: Book
    
    @EnvironmentObject var model: BookModel
    @State var pageIndex = 0
    
    var body: some View {
        TabView(selection: $pageIndex) {
            ForEach(book.content.indices, id: \.self) { index in
                VStack {
                    Text(book.content[index])
                    Spacer()
                    Text(String(index + 1))
                }
            }
            .padding()
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
//        .onChange(of: pageIndex) { newValue in
//            model.updatePage(bookId: book.id, page: pageIndex)
//        }
        .onAppear{ pageIndex = book.currentPage }
    }
}

struct BookContentView_Previews: PreviewProvider {
    static var previews: some View {
        let model = BookModel()
        BookContentView(book: model.books.first!)
            .environmentObject(BookModel())
    }
}
