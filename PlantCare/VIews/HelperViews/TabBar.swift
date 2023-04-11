
    //
    //  TabBar.swift
    //  PlantCare
    //
    //  Created by Laura Gongaware on 7/15/22.
    //
import SwiftUI

struct TabBar: View {
    @Environment(\.colorScheme) var colorScheme
    
        var body: some View {
            TabView {
                MyCollectionListView()
                    .tabItem {
                        Label("My Collection", systemImage: "leaf.fill")
                    }
                StaticPlantListView()
                    .tabItem {
                        Label("Plant List", systemImage: "leaf.fill")
                    }
                InfoView()
                    .tabItem {
                        Label("Info", systemImage: "info.circle")
                    }
                InspirationView()
                    .tabItem {
                        Label("Inspiration", systemImage: "sun.and.horizon")
                    }
            } .accentColor(colorScheme == .light ? .white: .white)
    }
}

    struct TabBar_Previews: PreviewProvider {
        static var previews: some View {
            TabBar()
        }
    }
