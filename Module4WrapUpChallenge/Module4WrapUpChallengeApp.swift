//
//  Module4WrapUpChallengeApp.swift
//  Module4WrapUpChallenge
//
//  Created by Braxton Ward on 9/14/22.
//

import SwiftUI

@main
struct Module4WrapUpChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            LibraryView()
                .environmentObject(BookModel())
        }
    }
}
