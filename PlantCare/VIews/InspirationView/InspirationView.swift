//
//  InspirationView.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/19/22.
//

import SwiftUI

struct InspirationView: View {
    var body: some View {
        ZStack {
            Color("bg").edgesIgnoringSafeArea(.all)
                VStack {
                    UnsplashRandom(clientId: "YOUR UNSPLASH CLIENT ID", query: "houseplants")
                        }
                    }
                }
            }
struct InspirationView_Previews: PreviewProvider {
    static var previews: some View {
        InspirationView()
    }
}
