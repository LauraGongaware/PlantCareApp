//
//  PlantListViewView.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/11/22.
//

import SwiftUI

struct PlantListView: View {
    var body: some View {
            NavigationView {
                ScrollView {
                ZStack {
                    
                    Text("Hello, world!")
                        .padding()
                }
            }
        }.background(Color(red: 0.67, green: 0.80, blue: 0.68).edgesIgnoringSafeArea(.all))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PlantListView()
    }
}
