//
//  WorkoutView.swift
//  WorkoutApp
//
//  Created by stepanyan hovhannes on 16/11/2021.
//

import SwiftUI

struct WorkoutView: View {
    var body: some View {
        NavigationView {
            Text("hello")
            .navigationTitle("Workout")
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView()
    }
}
