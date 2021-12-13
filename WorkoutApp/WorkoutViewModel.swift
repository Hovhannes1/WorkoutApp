//
//  WorkoutViewModel.swift
//  WorkoutApp
//
//  Created by stepanyan hovhannes on 01/12/2021.
//
import MapKit
import SwiftUI

class WorkoutViewModel : ObservableObject {
    @Published var workouts :[Data] = []
    let cache = NSCache<NSString, DataClass>()
    
    init() {
        getData()
    }
    func getData() {
        if let cachedWorkouts = cache.object(forKey: "CachedWorkouts") {
            setData(data: cachedWorkouts.getData())
        }
    }
    
    func setData(data: [Data]) {
        self.workouts = data
    }
    
    func saveData() {
        let dataToSave = DataClass(arr: workouts)
        cache.setObject(dataToSave, forKey: "CachedWorkouts")
    }
    
    func addWorkout(date: String,image: String,distance: Double,time: Int,averageSpeed: Double,startLocation:CLLocationCoordinate2D,endLocation:CLLocationCoordinate2D,cordinatePath:Array<CLLocationCoordinate2D>){
        workouts.append(Data(date: date, image: image, distance: distance, time: time, averageSpeed: averageSpeed, startLocation: startLocation, endLocation: endLocation, cordinatePath: cordinatePath))
    }
    
    func deleteItem(indexSet: IndexSet) {
        workouts.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        workouts.move(fromOffsets: from, toOffset: to)
    }
    
}

final class DataClass {
    let arr: [Data]
    
    init(arr: [Data]) {
        self.arr = arr
    }
    
    func getData() -> [Data] {
        return self.arr
    }
}
