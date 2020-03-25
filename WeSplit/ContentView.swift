// progress: https://www.hackingwithswift.com/books/ios-swiftui/creating-a-form
//
//  ContentView.swift
//  WeSplit
//
//  Created by Colucci, David on 3/23/20.
//  Copyright © 2020 Colucci, David. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Hello World!")
                }
            }
            .navigationBarTitle(Text("What's good New York"), displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
