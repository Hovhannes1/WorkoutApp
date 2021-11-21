//
//  ProfileView.swift
//  WorkoutApp
//
//  Created by stepanyan hovhannes on 16/11/2021.
//

import SwiftUI

struct ProfileView: View {
    @State var name: String = ""
        @State var surname:  String = ""
        let gender = ["Female","Male","Others"]
        @State var default_gen: String = "Female"
        @State private var age = Date()
        var body: some View {
            NavigationView {
                Form{
                    TextField("First Name", text: $name)
                    TextField("Last Name", text: $surname)
                    Picker("gender", selection: $default_gen){
                        ForEach(gender, id:\.self){
                            Label in Text(Label)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    DatePicker("Date of Birth", selection: $age, displayedComponents: [.date])
                    Button(action: {
                        print("submitted ..") //here to be changed after
                    }) {
                        Text("Save")
                        
                    }
                               
                }.navigationTitle("Profile")
            }
        
        }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
