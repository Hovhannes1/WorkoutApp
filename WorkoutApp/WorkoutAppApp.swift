//
//  WorkoutAppApp.swift
//  WorkoutApp
//
//  Created by stepanyan hovhannes on 16/11/2021.
//
import CoreLocation
import SwiftUI

@main   
struct WorkoutAppApp: App {
    
        let locationManager = CLLocationManager()
    
    
//        // Ask for Authorisation from the User.
//        self.locationManager.requestAlwaysAuthorization()
//
//        // For use in foreground
//        self.locationManager.requestWhenInUseAuthorization()
//
//        if CLLocationManager.locationServicesEnabled() {
//            locationManager.delegate = self
//            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
//            locationManager.startUpdatingLocation()
//        }
    
    var body: some Scene {
        WindowGroup {
            AppTabsView().environmentObject(WorkoutViewModel())
        }
    }
}
