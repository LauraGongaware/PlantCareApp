//
//  ContentView.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/15/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var currentMode
    var body: some View {
        TabBar()
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ForEach(ColorScheme.allCases, id: \.self) {
//            ContentView().preferredColorScheme($0)
//        }
//    }
//}
