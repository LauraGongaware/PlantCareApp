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
            if self.isActive {
                PlantListView()
            } else {
                Color(red: 0.67, green: 0.80, blue: 0.68).edgesIgnoringSafeArea(.all)
                Text("Flourish with ease")
                    .font(Font.largeTitle)
                    .foregroundColor(Color.white)
                
        }
    } .onAppear {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            withAnimation {
                self.isActive = true
                }
            }
        }
    }
}
struct SplashPage_Previews: PreviewProvider {
    static var previews: some View {
        SplashPage()
    }
}
