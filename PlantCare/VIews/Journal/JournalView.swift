//
//  JournalView.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/18/22.
//

import SwiftUI

struct JournalView: View {
    @ObservedObject var wateringViewModel = WateringViewModel()
    @ObservedObject var fertilizeViewModel = FertilzeViewModel()
    @ObservedObject var addedDateViewModel =  AddedDateViewModel()
    @ObservedObject var noteViewModel = NoteViewModel()
    
    
    var body: some View {
////            Color("bg").edgesIgnoringSafeArea(.all)
//                    JournalTabBar()
            List {
                Section("Waterings") {
                    ForEach(wateringViewModel.waterings) { watering in
                        Text("Watered on \(watering.date)")
                    }
                }
                Section("Fertilizing") {
                    ForEach(fertilizeViewModel.fertilizings) {
                        fertilizing in
                        Text("Fertilized on \(fertilizing.date)")
                    }
                }
                Section("Plant Notes") {
                    //Needs Navigation View
                    ForEach(noteViewModel.notes) {
                        note in
                        Text("\(note.date) note")
                    }
                }
                Section("Plant Added Date") {
                    ForEach(addedDateViewModel.addedDates) {
                        addedDate in
                        Text("Plant added on \(addedDate.date)")
                    }
                }
        }.navigationTitle("Plant Journal")
            .id(UUID())
        .onAppear {
            setupViews()
    }
    }
    func setupViews() {
        wateringViewModel.loadFromPersistenceStore()
        fertilizeViewModel.loadFromPersistenceStore()
        addedDateViewModel.loadFromPersistenceStore()
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView()
    }
}
