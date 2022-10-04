//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Safal Neupane on 21/9/2022.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ScrumsView(scrums: $scrums)
            }
        }
    }
}
