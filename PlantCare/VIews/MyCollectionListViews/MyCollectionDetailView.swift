//
//  MyCollectionDetailView.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/13/22.
//

import SwiftUI
import UIKit

struct MyCollectionDetailView: View {
    var plantCollection: Plant?
    
    @EnvironmentObject var collectionViewModel: MyCollectionViewModel
    
    @State var plantNameText: String = ""
    @State var scientificNameText: String = ""
    @State private var water = 0
    @State private var sunlight = 0
    @State private var staticImage: String = ""
    @State var toxicity: Bool = false
    @State var descriptionText: String = ""
    @State var image = Data()
    
    @State var date = Date()
    
    @State private var isShowPhotoLibrary = false
    @State private var isShowDatePicker = false
//    @State private var image = UIImage?
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color("bg").edgesIgnoringSafeArea(.all)
          
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        self.isShowPhotoLibrary = true
                    }) { Image(systemName: "photo")
                        .font(.system(size: 15))
                        .foregroundColor(.black)
                    }
                }
                    ZStack {
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 300, height: 300)
                    
                    if let image = collectionViewModel.image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .edgesIgnoringSafeArea(.all)
                            .clipShape(Circle())
                    } else {
                        Image(staticImage)
                        .resizable()
                        .scaledToFit()
                    }
                }
                VStack(alignment: .center) {
                    TextField("Plant Name", text: $plantNameText)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        .font(Font.system(size: 20).bold())
                        .foregroundColor(.black)
                    TextField("Scientific Name", text: $scientificNameText)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        .font(Font.system(size: 15).italic())
                        .foregroundColor(.black)
                    
                    HStack {
                        Text("Water Requirements :")
                        Picker("Water Needs", selection: $water, content: {
                            HStack {
                                Text("\(1)")
                                Image(systemName: "drop.fill")
                            }.tag(1)
                            HStack {
                                Text("\(2)")
                                Image(systemName: "drop.fill")
                            }.tag(2)
                            HStack {
                                Text("\(3)")
                                Image(systemName: "drop.fill")
                            }.tag(3)
                            HStack {
                                Text("\(4)")
                                Image(systemName: "drop.fill")
                            }.tag(4)
                            HStack {
                                Text("\(5)")
                                Image(systemName: "drop.fill")
                            }.tag(5)
//                       Text("\(1)").tag(1)
//                       Text("\(2)").tag(2)
//                       Text("\(3)").tag(3)
//                       Text("\(4)").tag(4)
//                       Text("\(5)").tag(5)
                            
                        })
                    }
                    
                    HStack {
                        Text("Sunlight Requirements :")
                    Picker("Sun Needs", selection: $sunlight, content: {
                        HStack {
                            Text("\(1)")
                            Image(systemName: "sun.max.fill")
                        }.tag(1)
                        HStack {
                            Text("\(2)")
                            Image(systemName: "sun.max.fill")
                        }.tag(2)
                        HStack {
                            Text("\(3)")
                            Image(systemName: "sun.max.fill")
                        }.tag(3)
                        HStack {
                            Text("\(4)")
                            Image(systemName: "sun.max.fill")
                        }.tag(4)
                        HStack {
                            Text("\(5)")
                            Image(systemName: "sun.max.fill")
                        }.tag(5)
                        
                        
//                        Text("\(1)").tag(1)
//                           Text("\(2)").tag(2)
//                           Text("\(3)").tag(3)
//                           Text("\(4)").tag(4)
//                           Text("\(5)").tag(5)
                        
                    })
                        }
                                                
                    Toggle(isOn: $toxicity, label: {
                        Text("Toxicity -")
                    }).toggleStyle(SafeForPets())
                    
                    TextEditor(text: $descriptionText)
                
            }
                HStack {
                    Button {
                        if plantCollection == nil {
                            prepareForCreateCollectionItem(plantName: plantNameText, scientificName: scientificNameText, water: water, sunlight: sunlight, description: descriptionText, staticImage: staticImage, toxicity: toxicity, date: date)
                            collectionViewModel.saveToPhoto()
//                            collectionViewModel.SaveImage()
                        
                        } else {
                            prepareForUpdateCollectionItem()
                            collectionViewModel.saveToPhoto()
                        }
                        dismiss()
                        
                    } label: {
                        ZStack {
                            Rectangle().fill(.ultraThinMaterial)
                                .cornerRadius(12)
                            Text(plantCollection == nil ? "Save" : "Update")
                        }
                    }.frame(width: 250, height: 55)
                    
                    Button(action: {
                        self.isShowDatePicker = true
                    }) { Image(systemName: "calendar.badge.plus")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                    }
                    .onAppear(perform: requestPush)
                }
            }
            .padding()
            .cornerRadius(15)
            .sheet(isPresented: $isShowPhotoLibrary) {
                ImagePicker(sourceType: .photoLibrary, selectedImage: $collectionViewModel.image)
                //change from files to camera
                //                    ImagePicker(sourceType: .camera, selectedImage: self.$image)
                
            }
            
            .sheet(isPresented: $isShowDatePicker, content: {
                VStack {
                DatePicker("Select time",
                           selection: $date, displayedComponents: [.date, .hourAndMinute])
                Button(action: {
                    scheduleNotification()
                    isShowDatePicker = false
                }) {
                    ZStack {
                        Rectangle().fill(.ultraThinMaterial)
                            .cornerRadius(12)
                    Text("Schedule Watering")
                    }.frame(width: 250, height: 55)
                }
                }.padding()
                Text("Watering Recommendations")
                    .font(.headline)
                    .padding()
                VStack(alignment: .leading) {
                HStack {
                    Text("Water every month and a half")
                    Image(systemName: "drop.fill")
                        .foregroundColor(.cyan)
                    Image(systemName: "drop")
                        .foregroundColor(.cyan)
                    Image(systemName: "drop")
                        .foregroundColor(.cyan)
                    Image(systemName: "drop")
                        .foregroundColor(.cyan)
                    Image(systemName: "drop")
                        .foregroundColor(.cyan)
                }
                HStack {
                    Text("Water once a month                ")
                    Image(systemName: "drop.fill")
                        .foregroundColor(.cyan)
                    Image(systemName: "drop.fill")
                        .foregroundColor(.cyan)
                    Image(systemName: "drop")
                        .foregroundColor(.cyan)
                    Image(systemName: "drop")
                        .foregroundColor(.cyan)
                    Image(systemName: "drop")
                        .foregroundColor(.cyan)
                }
                HStack {
                    Text("Water every 3 weeks               ")
                    Image(systemName: "drop.fill")
                        .foregroundColor(.cyan)
                    Image(systemName: "drop.fill")
                        .foregroundColor(.cyan)
                    Image(systemName: "drop.fill")
                        .foregroundColor(.cyan)
                    Image(systemName: "drop")
                        .foregroundColor(.cyan)
                    Image(systemName: "drop")
                        .foregroundColor(.cyan)
                }
                HStack {
                    Text("Water every 1-2 weeks            ")
                    Image(systemName: "drop.fill")
                        .foregroundColor(.cyan)
                    Image(systemName: "drop.fill")
                        .foregroundColor(.cyan)
                    Image(systemName: "drop.fill")
                        .foregroundColor(.cyan)
                    Image(systemName: "drop.fill")
                        .foregroundColor(.cyan)
                    Image(systemName: "drop")
                        .foregroundColor(.cyan)
                }
                HStack {
                    Text("Water at least once a week     ")
                    Image(systemName: "drop.fill")
                        .foregroundColor(.cyan)
                    Image(systemName: "drop.fill")
                        .foregroundColor(.cyan)
                    Image(systemName: "drop.fill")
                        .foregroundColor(.cyan)
                    Image(systemName: "drop.fill")
                        .foregroundColor(.cyan)
                    Image(systemName: "drop.fill")
                        .foregroundColor(.cyan)
                    }
                }
            })
        }
        .onAppear {
                if let plantCollection = plantCollection {
                    plantNameText = plantCollection.plantName
                    scientificNameText = plantCollection.scientificName
                    water = plantCollection.water
                    sunlight = plantCollection.sunlight
                    toxicity = plantCollection.toxicity
                    staticImage = plantCollection.staticImage
                    descriptionText = plantCollection.description
                    date = plantCollection.date
//                    image = plantCollection.image
            }
        }
        .onDisappear {
            collectionViewModel.loadFromPersistenceStore()
            collectionViewModel.loadPhoto()
    }
}
    func prepareForCreateCollectionItem(plantName: String?, scientificName: String?, water: Int?, sunlight: Int?, description: String?, staticImage: String?, toxicity: Bool?, date: Date?) {
        guard let plantName = plantName, !plantName.isEmpty,
        let scientificName = scientificName, !scientificName.isEmpty,
        let water = water,
        let sunlight = sunlight,
        let description = description, !description.isEmpty,
        let staticImage = staticImage,
        let toxicity = toxicity,
        let date = date
        else { return }
      
        let collectionItem = Plant(plantName: plantName, scientificName: scientificName, water: water, sunlight: sunlight, description: description, toxicity: toxicity, staticImage: staticImage)
        
        collectionViewModel.createCollectionItem(collectionItem)
}
    
    func prepareForUpdateCollectionItem() {
        let plantName = plantNameText
        let scientificName = scientificNameText
        let water = water
        let sunlight = sunlight
        let description = descriptionText
        let staticImage = staticImage
        let toxicity = toxicity
        let date = date
        guard !plantName.isEmpty, !description.isEmpty else { return }
        if let plantCollection = plantCollection {
            collectionViewModel.update(plantCollection, plantName, scientificName, water, sunlight, description, toxicity, staticImage, date)
        }
    }
    
    func scheduleNotification() -> Void {
        let content = UNMutableNotificationContent()
        content.title = "Watering Reminder"
        content.body = "Time to water your plant!"
        var reminderDate = date
        if reminderDate < Date() {
            if let addedValue = Calendar.current.date(byAdding: .day, value: 1, to: reminderDate) {
                reminderDate = addedValue
            }
        }
        let comps = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: reminderDate)
        let trigger = UNCalendarNotificationTrigger(dateMatching: comps, repeats: false)
        let request = UNNotificationRequest(identifier: "alertNotificationUnique", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print(error)
            }
        }
    }
    
    func requestPush() -> Void {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("Ready to go")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
}




//struct MyCollectionDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            MyCollectionDetailView()
//
//        }
//    }
//}

struct SafeForPets: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            configuration.label
            Text(configuration.isOn ? "plant is not safe for pets" : "plant is safe for pets")
            Image(systemName: "pawprint.circle")
                .foregroundColor(configuration.isOn ? .red : .green)
                .onTapGesture {
                    configuration.isOn.toggle()
            }
        }
    }
}

