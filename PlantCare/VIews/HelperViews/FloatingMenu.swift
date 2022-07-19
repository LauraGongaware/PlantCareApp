//
//  FloatingMenu.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/17/22.
//

import SwiftUI


struct FloatingMenu: View {
    @State var showMenuItem1 = false
    @State var showMenuItem2 = false
    @State var showMenuItem3 = false
    @State var showMenuItem4 = false
    
    @ObservedObject var wateringViewModel = WateringViewModel()
    @ObservedObject var fertilizeViewModel = FertilzeViewModel()
    @ObservedObject var noteViewModel = NoteViewModel()
    
    var body: some View {
       
        VStack {
            Spacer()
            if showMenuItem1 {
            MenuItem(icon: "camera.fill")
            }
            if showMenuItem2 {
            MenuItem(icon: "pencil")
            }
            if showMenuItem3 {
                Button {
                    wateringViewModel.createWatering(watering: Watering(), journal: Journal(), date: Date(), journalViewModel: JournalViewModel())
//                    wateringViewModel.createWatering(watering: Watering(), date: Date())
                } label: {
                    MenuItem(icon: "drop.fill")
                }
            }
            if showMenuItem4 {
                Button {
                    fertilizeViewModel.createFertilizing(fertilizing: Fertilize())
                } label: {
                    MenuItem(icon: "eyedropper")
                }
            }
            
        Button(action:  {
            self.showMenu()
        }) {
        Image(systemName: "plus.circle.fill")
            .resizable()
            .frame(width: 50, height: 50)
            .foregroundColor(.black)
            .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
            }
        }
        .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
    }
    
    func showMenu() {
        showMenuItem4.toggle()
        showMenuItem3.toggle()
        showMenuItem2.toggle()
        showMenuItem1.toggle()
    }
}

struct FloatingMenu_Previews: PreviewProvider {
    static var previews: some View {
        FloatingMenu()
    }
}

struct MenuItem: View {
    var icon: String
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.black)
                .frame(width: 45, height: 45)
            Image(systemName: icon)
                .imageScale(.large)
                .foregroundColor(.white)
            
        }.shadow(color: .gray, radius: 0.2, x: 1, y: 1)
    }
}
