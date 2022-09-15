//
//  LibraryView.swift
//  Module4WrapUpChallenge
//
//  Created by Braxton Ward on 9/14/22.
//

import SwiftUI

struct LibraryView: View {
    @EnvironmentObject private var model:BookModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 30) {
                    ForEach(model.books) { book in
                        NavigationLink                    (
                            destination: BookDetailsView(book: book),
                            label: { BookSnapshotView(book: book)
                                    .padding(.horizontal, 20)
                            }
                        )
                        
                    }
                }
                .padding(.top)
            }
            .navigationTitle("My Library")
        }
        
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
            .environmentObject(BookModel())
    }
}
