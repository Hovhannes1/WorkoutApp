//
//  data.swift
//  WorkoutApp
//
//  Created by boutiab massilva on 23/11/2021.
//
import MapKit
import SwiftUI
struct Data: Identifiable {
    var id = UUID()
    var date: String
    var image: String
    var distance: Double
    var time: Int
    var averageSpeed: Double
    var startLocation:CLLocationCoordinate2D
    var endLocation:CLLocationCoordinate2D
    var cordinatePath:Array<CLLocationCoordinate2D>
//    static var dataofwork = [ data(date: date(), image: "hare", distanc: 0.0 , time: 5, averageSpeed: 3, startLocation: CLLocationCoordinate2D, endLocation: <#T##CLLocationCoordinate2D#>, cordinatePath: <#T##Array<CLLocationCoordinate2D>#>)
//
//    ]
}


