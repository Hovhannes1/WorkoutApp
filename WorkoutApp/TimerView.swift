//
//  TimerView.swift
//  WorkoutApp
//
//  Created by stepanyan hovhannes on 16/11/2021.
//

import SwiftUI

struct TimerView: View {
    let types = ["bicycle", "hare", "figure.walk"]
    
    @State var type: String = "bicycle"
    
    @State var timerIsOn = false
    @State var timerStoped = false
    
    @State var timeRemaining = 0
        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        VStack {
            Text(type == "bicycle" ? "Bike": type == "hare" ? "Run" : "Walk")
            Spacer()
            
            Text("00:00:00")
                .font(.title)
            Text("\(timeRemaining)")
                        .onReceive(timer) { _ in
                            if timerIsOn {
                                timeRemaining += 1
                            }
                        }
            Text("0 m")
                .font(.title2)
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
            Button {
                if(!timerIsOn && !timerStoped) {
                    timerIsOn = true
                    
                }
                else if(timerIsOn) {
                    timerIsOn = false
                    timerStoped = true
                }
            } label: {
                if(timerIsOn) {
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
        }.padding()
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
