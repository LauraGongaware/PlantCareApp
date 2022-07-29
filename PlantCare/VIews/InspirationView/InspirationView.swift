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
                    UnsplashRandom(clientId: "b9a4743e8c3fc2ff4cd6800bfeedfdcb40f2c803dd119a72eed7e626503b9daa", query: "houseplants")
                        }
                    }
                }
            }
struct InspirationView_Previews: PreviewProvider {
    static var previews: some View {
        InspirationView()
    }
}
