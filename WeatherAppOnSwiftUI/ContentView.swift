//
//  ContentView.swift
//  WeatherAppOnSwiftUI
//
//  Created by Алексей Соболевский on 7.07.22.
//

import SwiftUI

struct ContentView: View {
    @State private var input = ""
    
    @ObservedObject private var viewModel = WeatherViewModel()
    var body: some View {
        VStack {
            TextField("Enter city",
                      text: $input,
                      onEditingChanged: { _ in },
                      onCommit: {
                if !self.input.isEmpty {
                    self.viewModel.fetch(city: self.input)
                }
            })
                .font(.title)
            
            Divider()
            
            Text(viewModel.weatherInfo)
                .font(.body)
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
