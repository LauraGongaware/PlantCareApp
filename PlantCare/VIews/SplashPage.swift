//
//  SplashPage.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/11/22.
//

import SwiftUI

struct SplashPage: View {

    @State var isActive:Bool = false

    var body: some View {

        ZStack {
            ZStack {
            if self.isActive {
//                StaticPlantListView()
//                MyCollectionListView()
                ContentView()

            } else {
                Color("bg").edgesIgnoringSafeArea(.all)
                Image("splash")
                    .resizable()
                    .frame(width: 300, height: 300, alignment: .center)
                Text("Flourishing simplified")
                    .font(Font.largeTitle)
                    .foregroundColor(Color.white)

                }
            }
        }.onAppear(perform: splashScreen)
    }
    func splashScreen() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            withAnimation {
        self.isActive = true
            }
        }
    }
}

struct SplashPage_Previews: PreviewProvider {
    static var previews: some View {
        SplashPage()
    }
}
