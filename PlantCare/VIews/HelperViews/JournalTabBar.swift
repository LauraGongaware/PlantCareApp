//
//  JournalTabBar.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/18/22.
//

import Foundation
import SwiftUI
struct JournalTabBar: View {
        var body: some View {
            TabView {
                MyCollectionListView()
                    .tabItem {
                        Label("Plant Info", systemImage: "leaf.fill")
                    
                    }
                JournalView()
                    .tabItem {
                        Label("Journal", systemImage: "note.text")
                    }
            } .accentColor(.black)
    }
}

    struct JournalTabBar_Previews: PreviewProvider {
        static var previews: some View {
            JournalTabBar()
        }
    }
