//
//  NotificationManager.swift
//  mainAxxess
//
//  Created by shaurya on 4/2/23.
//

import Foundation
import UserNotifications

class NotificationManager :NSObject {
    
    static let instances = NotificationManager()
    let notificationCenter = UNUserNotificationCenter.current()
    
   override init() {
        super.init()
        notificationCenter.delegate = self
    }
    
    func requestAuthroization() {
        
        let options:UNAuthorizationOptions  = [.alert,.sound,.badge]
        
        notificationCenter.requestAuthorization(options: options) { (succes, error) in
            if let error = error {
                print(error.localizedDescription)
            }else {
                print(succes)
            }
            
        }
    }
    
    func isAuthorizeForNotification() async ->  Bool {
        let authorization = await notificationCenter.notificationSettings()
        if authorization.authorizationStatus == .authorized {
            return true
        }else {
            return false
        }
    }
    
    func scheduleNotifications(medData:MedData,intakes:[Date],dataID:String) async {
    
        let content = UNMutableNotificationContent()
        content.title = "Call Doc"
        content.body = "\(medData.name ?? "MedData"), you need to contact the doctor!" //what to do?
        content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "alarm.mp3"))
        
        
        for time in intakes {
            
            let components = Calendar.current.dateComponents([.hour,.minute], from:  time)
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
            let id = UUID().uuidString
            let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)

            
            // adding Notfication to notification View Model
            
            let notification = NotificationModel(context: CoreDataManager.shared.viewContext)
            notification.medDataId = dataID
            notification.notificationId = id
            notification.medData  = medData
            
            //MedData.save()
             
            try? await notificationCenter.add(request)
        }
        
    }
    
    func getAllPendingNotification() {
        notificationCenter.getPendingNotificationRequests { request in
            print(request)
        }
    }
    func getDeliveredNotification(){
        notificationCenter.getDeliveredNotifications { (notifications) in
            for notification:UNNotification in notifications {
                print(notification.request.identifier)
            }
        }
    }
    
    func removeNotifciationWithId(id:[String]) {
        notificationCenter.removePendingNotificationRequests(withIdentifiers: id)
    }
    
    func removeAllPendingNotification() {
        notificationCenter.removeAllPendingNotificationRequests()
    }
    
    func removeAllDelviredNotification() {
        notificationCenter.removeAllDeliveredNotifications()
    }
    
}



extension NotificationManager:UNUserNotificationCenterDelegate {
    
    // Foreground Notification
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
        return [.banner,.sound,.badge]
    }
    
    
}
