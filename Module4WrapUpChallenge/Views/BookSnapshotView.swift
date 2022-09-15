//
//  BookSnapshotView.swift
//  Module4WrapUpChallenge
//
//  Created by Braxton Ward on 9/15/22.
//

import SwiftUI

struct BookSnapshotView: View {
    var book: Book
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(15)
                .shadow(color: .gray, radius: 5, x: -5, y: 5)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(book.title)
                        .font(.title)
                        .fontWeight(.heavy)
                    
                    Spacer()
                    
                    if book.isFavourite {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 28, height: 28)
                            .foregroundColor(.yellow)
                    }
                }
                
                Text(book.author)
                    .italic()
                
                Image("cover\(book.id)")
                    .resizable()
                    .scaledToFit()
            }
            .padding()
        }
        .foregroundColor(.black)
    }
}

struct BookSnapshotView_Previews: PreviewProvider {
    static var previews: some View {
        let model = BookModel()
        BookSnapshotView(book: model.books.first!)
    }
}
