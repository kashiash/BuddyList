//
//  ContentView.swift
//  BuddyList
//
//  Created by Jacek Kosiński G on 22/01/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, debesciaki!")
                .onAppear{
                    //FuckingGoodApp()
                }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}