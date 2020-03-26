// progress: https://www.hackingwithswift.com/books/ios-swiftui/modifying-program-state
//
//  ContentView.swift
//  WeSplit
//
//  Created by Colucci, David on 3/23/20.
//  Copyright © 2020 Colucci, David. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry", "Ron", "Hermoine"]
    @State private var selectedStudent = 0

    var body: some View {
        VStack {
            Picker("Select your student", selection: $selectedStudent) {
                ForEach(0 ..< students.count) {
                    Text(self.students[$0])
                }
            }
            Text("You chose student \(students[selectedStudent])")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
