import SwiftUI
import MapKit

struct WorkoutDetails: View {
    @State var data: Data
    func timeString(time:Int) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    var body: some View {
        
        let region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: data.startLocation.latitude, longitude: data.startLocation.longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        )
        
        
        VStack{
            MapView(region: region, lineCoordinates: data.cordinatePath)
                .edgesIgnoringSafeArea(.all)
                .frame(width: .infinity, height: .infinity)
            
            HStack{
                VStack{
                    Text("Distance").padding(.bottom,8)
                    Text("\(String(format: "%.2f", data.distance)) m")
                }
                Spacer()
                VStack{
                    Text("Time").padding(.bottom,8)
                    Text(timeString(time: data.time))
                }
                Spacer()
                VStack{
                    Text("Speed").padding(.bottom,8)
                    Text("\(String(format: "%.2f", data.averageSpeed)) m/s")
                }
            }.padding(24)
        }
        .padding(8)
        .navigationTitle("Workout Details")
        
    }
}

