//
//  TimerView.swift
//  WorkoutApp
//
//  Created by stepanyan hovhannes on 16/11/2021.
//

import MapKit
import SwiftUI

struct TimerView: View {
    @EnvironmentObject var data: WorkoutViewModel
    @Environment(\.presentationMode) var presentationMode
    let types = ["bicycle", "hare", "figure.walk"]
    
    @StateObject var locationManagerMain = LocationManager()
    
    @State var type: String = "bicycle"
    
    @State var oldLocation : CLLocationCoordinate2D = LocationManager().lastLocation?.coordinate ?? CLLocationCoordinate2DMake( 47.64270444696082, 6.838401896708962);
    
    @State var timerIsOn = false
    @State var timerStoped = false
    
    @State var cordinatesList:Array<CLLocationCoordinate2D> = []
    
    @State var timeRemaining = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    func timeString(time:Int) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    let locationManager = CLLocationManager()
    weak var mapView: MKMapView!
    @State var totalDisatnce:Double = 0.0
    
    func getDistance(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D) -> CLLocationDistance {
        let from = CLLocation(latitude: from.latitude, longitude: from.longitude)
        let to = CLLocation(latitude: to.latitude, longitude: to.longitude)
        return from.distance(from: to)
    }
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    var body: some View {
        VStack {
            Text(type == "bicycle" ? "Bike": type == "hare" ? "Run" : "Walk")
            Spacer()
            
            Text(timeString(time:timeRemaining))
                .font(.title)
                .onReceive(timer) { _ in
                    if timerIsOn {
                        timeRemaining += 1
                    }
                }
            
            Text("\(String(round(10 * totalDisatnce) / 10)) m")
                .font(.title2)
                .onReceive(timer) { _ in
                    if timerIsOn {
                        let newLocation:CLLocationCoordinate2D = locationManagerMain.lastLocation!.coordinate
                        
                        cordinatesList.append(newLocation)
                        
                        totalDisatnce += getDistance(from: newLocation, to: oldLocation)
                        
                        oldLocation = newLocation
                    }
                }
            Spacer()
            
            Picker("Priority", selection: $type) {
                ForEach(types, id: \.self) { label in
                    Button {
                        
                    } label: {
                        Image(systemName: label)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    }
                }
            }.padding(.bottom, 16)
                .pickerStyle(SegmentedPickerStyle())
            
            HStack {
                
                Button {
                    if(!timerIsOn && !timerStoped) {
                        timerIsOn = true
                        oldLocation = locationManagerMain.lastLocation!.coordinate
                    } else if(!timerIsOn && timerStoped) {
                        
                        let date = Date()
                        data.addWorkout(date: self.dateFormatter.string(from: date), image: type, distance: totalDisatnce, time: timeRemaining, averageSpeed: (totalDisatnce / Double(timeRemaining)), startLocation: cordinatesList[0], endLocation: cordinatesList[cordinatesList.endIndex - 1], cordinatePath: cordinatesList)
                        timerIsOn = false
                        timerStoped = false
                        totalDisatnce = 0
                        timeRemaining = 0
                        cordinatesList = []
                        
                    }
                    else if(timerIsOn && !timerStoped) {
                        timerIsOn = false
                        timerStoped = true
                    }
                } label: {
                    if(timerIsOn && !timerStoped) {
                        Image(systemName: "pause")
                            .foregroundColor(Color.white)
                        Text("Pause").foregroundColor(.white)
                    } else if (!timerIsOn && timerStoped) {
                        Image(systemName: "square.fill")
                            .foregroundColor(Color.white)
                        Text("Stop").foregroundColor(.white)
                    } else {
                        Image(systemName: "play.fill")
                            .foregroundColor(Color.white)
                        Text("Go").foregroundColor(.white)
                    }
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 36)
                .background(timerIsOn || timerStoped ? Color.red : Color.orange)
                .cornerRadius(24)
                
                if (!timerIsOn && timerStoped) {
                    Button {
                        timerIsOn = true
                        timerStoped = false
                        oldLocation = locationManagerMain.lastLocation!.coordinate
                    } label: {
                        Image(systemName: "arrow.clockwise")
                            .foregroundColor(Color.white)
                        Text("Continue").foregroundColor(.white)
                        
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal, 36)
                    .background(Color.orange)
                    .cornerRadius(24)
                }
            }
            
        }.padding()
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
