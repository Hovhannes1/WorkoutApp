//
//  WorkoutView.swift
//  WorkoutApp
//
//  Created by stepanyan hovhannes on 16/11/2021.
//

import SwiftUI
import MapKit
import Foundation

struct WorkoutView: View {
    @EnvironmentObject var dataModel : WorkoutViewModel
    
    var body: some View {
        
        
        NavigationView {
            
            Form{
                if(dataModel.workouts.count != 0) {
                    List{
                        ForEach(dataModel.workouts){workout in
                            theWork(data: workout)
                        }
                        .onDelete(perform: dataModel.deleteItem)
                        .onMove(perform: dataModel.moveItem)
                    }
                }
            }
            .navigationTitle("Workouts")
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        dataModel.saveData()
                    }
                }
            }
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView().environmentObject(WorkoutViewModel())
    }
}

struct Pin: Identifiable {
    let id = UUID()
    var location: MapMarker
}

struct theWork: View {
    
    let data: Data
    
    var body: some View {
        
        NavigationLink(destination: WorkoutDetails(data: data)) {
            VStack{
                HStack{
                    Image(systemName: data.image)
                    
                    Text(data.date)
                }
                let region = MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: data.startLocation.latitude, longitude: data.startLocation.longitude),
                    span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
                )
                
                let start = [
                    Pin(location: MapMarker(coordinate: data.startLocation, tint: .blue))
                ]
                
                
                Map(coordinateRegion: .constant(region), annotationItems: start) {
                    item in
                    item.location
                }.frame(width: .infinity, height: 240)
                
            }
        }
    }
}

