//
//  NotificationManager.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/26/22.
//

//import Foundation
//import SwiftUI
//
//class LocalNotificationManager: ObservableObject {
//    
//    var notifications = [Notification]()
//    
//    
//    func sendNotifications(title: String) {
//        
//    }
//    
//    init() {
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
//            if granted == true && error == nil {
//                print("Notifications permitted")
//            } else {
//                print("Notifications not permitted")
//            }
//        }
//    }
//}
