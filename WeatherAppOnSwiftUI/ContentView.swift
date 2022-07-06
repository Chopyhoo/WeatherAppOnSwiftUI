//
//  ContentView.swift
//  WeatherAppOnSwiftUI
//
//  Created by Алексей Соболевский on 7.07.22.
//

import SwiftUI

struct ContentView: View {
    @State private var input = ""
    var body: some View {
        VStack {
            TextField("Enter city", text: $input)
                .font(.title)
            
            Divider()
            
            Text(input)
                .font(.body)
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
